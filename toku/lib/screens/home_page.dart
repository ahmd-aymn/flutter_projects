import 'package:flutter/material.dart';
import 'package:toku/screens/colors_page.dart';
import 'package:toku/screens/family_members_page.dart';
import 'package:toku/screens/numbers_page.dart';
import 'package:toku/screens/phrases_page.dart';
import 'package:toku/widgets/home_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFEF6DB),
      appBar: AppBar(
        title: Text(
          'Toku',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Color(0xff46322B),
      ),
      body: Column(
        children: [
          HomeContainer(
            color: Color(0xffEF9235),
            label: 'Numbers',
            page: NumbersPage(),
          ),
          HomeContainer(
            color: Color(0xff558B37),
            label: 'Family Members',
            page: FamilyMembersPage(),
          ),
          HomeContainer(
            color: Color(0xff79359F),
            label: 'Colors',
            page: ColorsPage(),
          ),
          HomeContainer(
            color: Color(0xff50ADC7),
            label: 'Phrases',
            page: PhrasesPage(),
          ),
        ],
      ),
    );
  }
}
