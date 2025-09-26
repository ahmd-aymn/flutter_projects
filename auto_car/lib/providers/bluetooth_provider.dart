import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:permission_handler/permission_handler.dart';

import '../core/shared_prefs.dart';

class BluetoothProvider extends ChangeNotifier {
  BluetoothConnection? _connection;
  BluetoothDevice? _connectedDevice;
  final List<BluetoothDiscoveryResult> _devices = [];
  bool _isScanning = false;

  List<BluetoothDiscoveryResult> get devices => _devices;
  BluetoothDevice? get connectedDevice => _connectedDevice;
  bool get isConnected => _connection?.isConnected ?? false;
  bool get isScanning => _isScanning;

  BluetoothProvider() {
    _loadConnection();
  }

  Future<void> _loadConnection() async {
    final addr = await SharedPrefs.getCurrentDeviceAddress();
    final name = await SharedPrefs.getCurrentDeviceName();

    if (addr != null) {
      _connectedDevice = BluetoothDevice(address: addr, name: name);
      notifyListeners();
      await connectToSavedDevice();
    }
  }

  Future<bool> _requestBluetoothPermissions() async {
    final scanStatus = await Permission.bluetoothScan.request();
    final connectStatus = await Permission.bluetoothConnect.request();
    final advertiseStatus = await Permission.bluetoothAdvertise.request();
    final locationStatus = await Permission.locationWhenInUse.request();

    return scanStatus.isGranted &&
        connectStatus.isGranted &&
        advertiseStatus.isGranted &&
        locationStatus.isGranted;
  }

  Future<void> _ensureBluetoothIsOn() async {
    final state = await FlutterBluetoothSerial.instance.state;
    if (state != BluetoothState.STATE_ON) {
      // يحاول يفتح البلوتوث
      final turnedOn = await FlutterBluetoothSerial.instance.requestEnable();
      if (turnedOn!) {
        throw Exception("Bluetooth is required but not enabled");
      }
    }
  }

  Future<void> startScan() async {
    _devices.clear();
    _isScanning = true;
    notifyListeners();

    // اطلب الصلاحيات
    final granted = await _requestBluetoothPermissions();
    if (!granted) {
      _isScanning = false;
      notifyListeners();
      throw Exception("Bluetooth permissions not granted");
    }

    // اتأكد إن البلوتوث مفتوح
    await _ensureBluetoothIsOn();

    FlutterBluetoothSerial.instance
        .startDiscovery()
        .listen((result) {
          final exists = _devices.any(
            (e) => e.device.address == result.device.address,
          );
          if (!exists) {
            _devices.add(result);
            notifyListeners();
          }
        })
        .onDone(() {
          _isScanning = false;
          notifyListeners();
        });
  }

  Future<void> connectToDevice(BluetoothDevice device) async {
    await _ensureBluetoothIsOn();

    _connection = await BluetoothConnection.toAddress(device.address);
    _connectedDevice = device;

    await SharedPrefs.saveCurrentDevice(
      device.name ?? 'Unknown',
      device.address,
    );
    notifyListeners();
  }

  Future<void> connectToSavedDevice() async {
    if (_connectedDevice != null &&
        (_connection == null || !_connection!.isConnected)) {
      try {
        await _ensureBluetoothIsOn();
        _connection = await BluetoothConnection.toAddress(
          _connectedDevice!.address,
        );
        notifyListeners();
      } catch (e) {
        print("Auto reconnect failed: $e");
      }
    }
  }

  Future<void> sendCommand(String command) async {
    if (_connection?.isConnected ?? false) {
      _connection!.output.add(Uint8List.fromList("$command\n".codeUnits));
      await SharedPrefs.saveLastCommand(command);
    } else {
      throw Exception("Not connected");
    }
  }

  Future<void> disconnect() async {
    await _connection?.close();
    _connection = null;
    _connectedDevice = null;
    await SharedPrefs.clearCurrentDevice();
    notifyListeners();
  }
}
