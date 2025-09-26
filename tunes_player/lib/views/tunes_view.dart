import 'package:flutter/material.dart';
import 'package:tunes_player/widgets/tune_item.dart';
import 'package:tunes_player/widgets/tune_model.dart';

class TunesView extends StatelessWidget {
  const TunesView({super.key});

  final List<TuneModel> tunes = const [
    TuneModel(color: Color(0xffFE4039), tune: 'note1.wav'),
    TuneModel(color: Color(0xffFD982B), tune: 'note2.wav'),
    TuneModel(color: Color(0xffFDEB57), tune: 'note3.wav'),
    TuneModel(color: Color(0xff33AF57), tune: 'note4.wav'),
    TuneModel(color: Color(0xff009587), tune: 'note5.wav'),
    TuneModel(color: Color(0xff0097ED), tune: 'note6.wav'),
    TuneModel(color: Color(0xffA227AC), tune: 'note7.wav'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff243139),
        title: Text('Flutter Tunes', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: tunes.map((tune) => TuneItem(tuneModel: tune)).toList(),
      )
    );
  }
}
