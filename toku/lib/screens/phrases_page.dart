import 'package:flutter/material.dart';
import 'package:toku/core/app_assets/app_sounds.dart';
import 'package:toku/widgets/phrase_model.dart';

class PhrasesPage extends StatelessWidget {
  const PhrasesPage({super.key});

  final List<PhraseModel> phrases = const [
    //Are you coming?
    PhraseModel(
      sound: PhrasesSounds.areYouComing,
      containerColor: Color(0xff50ADC7),
      enWord: 'Are You Coming?',
      jpWord: 'rai masu ka?',
    ),
    //Don't forget to subscribe
    PhraseModel(
      sound: PhrasesSounds.dontForgetToSubscribe,
      containerColor: Color(0xff50ADC7),
      enWord: "Don't forget to subscribe",
      jpWord: 'koudoku wa wasure nai de kudasai',
    ),
    //How are you feeling?
    PhraseModel(
      sound: PhrasesSounds.howAreYouFeeling,
      containerColor: Color(0xff50ADC7),
      enWord: 'How are you feeling?',
      jpWord: 'dono you ni kanji te i masu ka',
    ),
    //I love anime
    PhraseModel(
      sound: PhrasesSounds.iLoveAnime,
      containerColor: Color(0xff50ADC7),
      enWord: 'I love anime',
      jpWord: 'watashi wa anime ga daisuki desu',
    ),
    //I love programming
    PhraseModel(
      sound: PhrasesSounds.iLoveProgramming,
      containerColor: Color(0xff50ADC7),
      enWord: 'I love programming',
      jpWord: 'programming ga daisuki desu',
    ),
    //What is your name?
    PhraseModel(
      sound: PhrasesSounds.whatIsYourName,
      containerColor: Color(0xff50ADC7),
      enWord: 'What is your name?',
      jpWord: 'namae wa nani desu ka',
    ),
    //Where are you going?
    PhraseModel(
      sound: PhrasesSounds.whrerAreYouGoing,
      containerColor: Color(0xff50ADC7),
      enWord: 'Where are you going?',
      jpWord: 'doko ni iku no desu ka',
    ),
    //Yes, I'm coming
    PhraseModel(
      sound: PhrasesSounds.yesImComing,
      containerColor: Color(0xff50ADC7),
      enWord: "Yes, I'm coming",
      jpWord: 'hai, ikiba masu',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff46322B),
        title: Text('Phrases', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: phrases.length,
        itemBuilder: (context, index) {
          return phrases[index];
        },
      ),
    );
  }
}
