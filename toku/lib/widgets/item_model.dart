import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:toku/widgets/word_model.dart';

class ItemModel extends StatelessWidget {
  final WordModel word;
  const ItemModel({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 70,
          decoration: BoxDecoration(color: Color(0xffFFF6DC)),
          child: Image.asset(word.image),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16),
            alignment: Alignment.centerLeft,
            height: 70,
            decoration: BoxDecoration(color: word.containerColor),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      word.jpWord,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Text(
                      word.enWord,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.play_arrow),
                  onPressed: () {
                    final AudioPlayer player = AudioPlayer();
                    player.play(AssetSource(word.sound));
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
