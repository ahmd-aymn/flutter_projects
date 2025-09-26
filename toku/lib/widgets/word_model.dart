import 'package:flutter/material.dart';

class WordModel {
  final String image;
  final String enWord;
  final String jpWord;
  final Color containerColor;
  final String sound;
  const WordModel({
    required this.image,
    required this.enWord,
    required this.jpWord,
    required this.containerColor,
    required this.sound,
  });
}
