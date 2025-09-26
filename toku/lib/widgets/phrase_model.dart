import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PhraseModel extends StatelessWidget {
  final String enWord;
  final String jpWord;
  final Color containerColor;
  final String sound;
  const PhraseModel({
    super.key,
    required this.enWord,
    required this.jpWord,
    required this.containerColor,
    required this.sound,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            alignment: Alignment.centerLeft,
            height: 70,
            decoration: BoxDecoration(color: containerColor),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      jpWord,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Text(
                      enWord,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.play_arrow),
                  onPressed: () async {
                    await AudioPlayer().play(AssetSource(sound));
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
