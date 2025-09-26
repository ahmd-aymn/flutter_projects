import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';

class TuneModel {
  final Color color;
  final String tune;
  const TuneModel({required this.color, required this.tune});

  void playSound()
  {
    final AudioPlayer player = AudioPlayer();
          player.play(AssetSource(tune));
  }
}
