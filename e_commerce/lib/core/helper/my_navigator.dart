import 'package:flutter/material.dart';

void myNavigator(context, {required Widget screen}) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return screen;
  }));
}
