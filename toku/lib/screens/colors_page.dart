import 'package:flutter/material.dart';
import 'package:toku/core/app_assets/app_images.dart';
import 'package:toku/core/app_assets/app_sounds.dart';
import 'package:toku/widgets/item_model.dart';
import 'package:toku/widgets/word_model.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

  final List<ItemModel> colors = const [
    //Black
    ItemModel(
      word: WordModel(
        sound: ColorsSounds.black,
        containerColor: Color(0xff79359F),
        enWord: 'Black',
        jpWord: 'Burakku',
        image: ColorsImages.black,
      ),
    ),
    //Brown
    ItemModel(
      word: WordModel(
        sound: ColorsSounds.brown,
        containerColor: Color(0xff79359F),
        enWord: 'Brown',
        jpWord: 'Chairo',
        image: ColorsImages.brown,
      ),
    ),
    //Red
    ItemModel(
      word: WordModel(
        sound: ColorsSounds.red,
        containerColor: Color(0xff79359F),
        enWord: 'Red',
        jpWord: 'aka',
        image: ColorsImages.red,
),
    ),
    //Green
    ItemModel(
      word: WordModel(
        sound: ColorsSounds.green,
        containerColor: Color(0xff79359F),
        enWord: 'Green',
        jpWord: 'Midori',
        image: ColorsImages.green,
      ),
    ),
    //Yellow
    ItemModel(
      word: WordModel(
        sound: ColorsSounds.yellow,
        containerColor: Color(0xff79359F),
        enWord: 'Yellow',
        jpWord: 'Kiiro',
        image: ColorsImages.yellow,
      ),
    ),
    //Dusty Yellow
    ItemModel(
      word: WordModel(
        sound: ColorsSounds.dustyYellow,
        containerColor: Color(0xff79359F),
        enWord: 'Dusty Yellow',
        jpWord: 'hokori no kiiro',
        image: ColorsImages.dustyYellow,
      ),
    ),
    //White
    ItemModel(
      word: WordModel(
        sound: ColorsSounds.white,
        containerColor: Color(0xff79359F),
        enWord: 'White',
        jpWord: 'shiro',
        image: ColorsImages.white,
      ),
    ),
    //Gray
    ItemModel(
      word: WordModel(
        sound: ColorsSounds.gray,
        containerColor: Color(0xff79359F),
        enWord: 'Gray',
        jpWord: 'gure',
        image: ColorsImages.gray,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff46322B),
        title: Text('Colors', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return ItemModel(word: colors[index].word);
        },
      ),
    );
  }
}
