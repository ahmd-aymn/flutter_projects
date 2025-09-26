import 'package:flutter/material.dart';
import 'package:tunes_player/widgets/tune_model.dart';

class TuneItem extends StatelessWidget {
  final TuneModel tuneModel;
  const TuneItem({super.key, required this.tuneModel});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: tuneModel.playSound,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: tuneModel.color),
        ),
      ),
    );
  }
}
