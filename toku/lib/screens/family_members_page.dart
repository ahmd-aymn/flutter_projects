import 'package:flutter/material.dart';
import 'package:toku/core/app_assets/app_images.dart';
import 'package:toku/core/app_assets/app_sounds.dart';
import 'package:toku/widgets/item_model.dart';
import 'package:toku/widgets/word_model.dart';

class FamilyMembersPage extends StatelessWidget {
  const FamilyMembersPage({super.key});

  final List<ItemModel> familyMembers = const [
    //Grand Father
    ItemModel(
      word: WordModel(
        sound: FamilyMembersSounds.grandFather,
        containerColor: Color(0xff558B37),
        enWord: 'Grand Father',
        jpWord: 'Ojisan',
        image: FamilyMembersImages.grandFather,
      ),
    ),
    //Grand Mother
    ItemModel(
      word: WordModel(
        sound: FamilyMembersSounds.grandMother,
        containerColor: Color(0xff558B37),
        enWord: 'Grand Mother',
        jpWord: 'Sobo',
        image: FamilyMembersImages.grandMother,
      ),
    ),
    //Father
    ItemModel(
      word: WordModel(
        sound: FamilyMembersSounds.father,
        containerColor: Color(0xff558B37),
        enWord: 'Father',
        jpWord: 'Chichioya',
        image: FamilyMembersImages.father,
      ),
    ),
    //Mother
    ItemModel(
      word: WordModel(
        sound: FamilyMembersSounds.mother,
        containerColor: Color(0xff558B37),
        enWord: 'Mother',
        jpWord: 'hahaoya',
        image: FamilyMembersImages.mother,
      ),
    ),
    //Son
    ItemModel(
      word: WordModel(
        sound: FamilyMembersSounds.son,
        containerColor: Color(0xff558B37),
        enWord: 'Son',
        jpWord: 'Musuko',
        image: FamilyMembersImages.son,
      ),
    ),
    //Daughter
    ItemModel(
      word: WordModel(
        sound: FamilyMembersSounds.daughter,
        containerColor: Color(0xff558B37),
        enWord: 'Daughter',
        jpWord: 'Musume',
        image: FamilyMembersImages.daughter,
      ),
    ),
    //Older Brother
    ItemModel(
      word: WordModel(
        sound: FamilyMembersSounds.olderBrother,
        containerColor: Color(0xff558B37),
        enWord: 'Older Brother',
        jpWord: 'Nisan',
        image: FamilyMembersImages.olderBrother,
      ),
    ),
    //Older Sister
    ItemModel(
      word: WordModel(
        sound: FamilyMembersSounds.olderSister,
        containerColor: Color(0xff558B37),
        enWord: 'Older Sister',
        jpWord: 'Ane',
        image: FamilyMembersImages.olderSister,
      ),
    ),
    //Younger Brother
    ItemModel(
      word: WordModel(
        sound: FamilyMembersSounds.youngerBrother,
        containerColor: Color(0xff558B37),
        enWord: 'Younger Brother',
        jpWord: 'Otouto',
        image: FamilyMembersImages.youngerBrother,
      ),
    ),
    //Younger Sister
    ItemModel(
      word: WordModel(
        sound: FamilyMembersSounds.youngerSister,
        containerColor: Color(0xff558B37),
        enWord: 'Younger Sister',
        jpWord: 'imouto',
        image: FamilyMembersImages.youngerSister,
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff46322B),
        title: Text('Family Members', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: familyMembers.length,
        itemBuilder: (context, index) {
          return ItemModel(word: familyMembers[index].word);
        },
      ),
    );
  }
}
