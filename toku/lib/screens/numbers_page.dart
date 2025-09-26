import 'package:flutter/material.dart';
import 'package:toku/core/app_assets/app_images.dart';
import 'package:toku/core/app_assets/app_sounds.dart';
import 'package:toku/widgets/item_model.dart';
import 'package:toku/widgets/word_model.dart';

class NumbersPage extends StatelessWidget {
  const NumbersPage({super.key});

  final List<ItemModel> numbers = const [
    ItemModel(
      word: WordModel(
        containerColor: Color(0xffEF9235),
        image: NumbersImages.numberOne,
        enWord: 'One',
        jpWord: 'Ichi',
        sound: NumberSounds.numberOne,
      ),
    ),
    ItemModel(
      word: WordModel(
        containerColor: Color(0xffEF9235),
        sound: NumberSounds.numberTwo,
        enWord: 'Two',
        jpWord: 'Ni',
        image: NumbersImages.numberTwo,
      ),
    ),
    ItemModel(
      word: WordModel(
        containerColor: Color(0xffEF9235),
        sound: NumberSounds.numberThree,
        enWord: 'Three',
        jpWord: 'San',
        image: NumbersImages.numberThree,
      ),
    ),
    ItemModel(
      word: WordModel(
        containerColor: Color(0xffEF9235),
        sound: NumberSounds.numberFour,
        enWord: 'Four',
        jpWord: 'Shi',
        image: NumbersImages.numberFour,
      ),
    ),
    ItemModel(
      word: WordModel(
        containerColor: Color(0xffEF9235),
        sound: NumberSounds.numberFive,
        enWord: 'Five',
        jpWord: 'Go',
        image: NumbersImages.numberFive,
      ),
    ),
    ItemModel(
      word: WordModel(
        containerColor: Color(0xffEF9235),
        sound: NumberSounds.numberSix,
        enWord: 'Six',
        jpWord: 'Roku',
        image: NumbersImages.numberSix,
      ),
    ),
    ItemModel(
      word: WordModel(
        containerColor: Color(0xffEF9235),
        sound: NumberSounds.numberSeven,
        enWord: 'Seven',
        jpWord: 'Sebun',
        image: NumbersImages.numberSeven,
      ),
    ),
    ItemModel(
      word: WordModel(
        containerColor: Color(0xffEF9235),
        sound: NumberSounds.numberEight,
        enWord: 'Eight',
        jpWord: 'Hachi',
        image: NumbersImages.numberEight,
      ),
    ),
    ItemModel(
      word: WordModel(
        containerColor: Color(0xffEF9235),
        sound: NumberSounds.numberNine,
        enWord: 'Nine',
        jpWord: 'Kyuu',
        image: NumbersImages.numberNine,
      ),
    ),
    ItemModel(
      word: WordModel(
        containerColor: Color(0xffEF9235),
        sound: NumberSounds.numberTen,
        enWord: 'Ten',
        jpWord: 'Jyuu',
        image: NumbersImages.numberTen,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff46322B),
        title: Text('Numbers', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return ItemModel(word: numbers[index].word);
        },
      ),
    );
  }
}
