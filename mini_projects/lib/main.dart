import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PointsCounter(),
  ));
}

//Flutter Basics Section
class HelloWorld extends StatelessWidget {
  const HelloWorld({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            color: Colors.blue,
            child: Center(
              child: Text("Hello World"),
            ),
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.red,
            child: Center(
              child: Text("Hello World"),
            ),
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.green,
            child: Center(
              child: Text("Hello World"),
            ),
          ),
        ],
      ),
    ));
  }
}
//Birthday Card Section
class BirthdayCard extends StatelessWidget {
  const BirthdayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(image: AssetImage('assets/images/birthday_card.png')),
    );
  }
}
//Business Card Section
class BussinessCardApp extends StatelessWidget {
  const BussinessCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF2B475E),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 82,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/personal_photo.png'),
              radius: 80,
            ),
          ),
          Text(
            'Ahmed Ayman',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Pacifico',
              fontSize: 32,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Flutter Developer',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Divider(
            thickness: 0.4,
            indent: 16,
            endIndent: 16,
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(
                Icons.phone,
                color: Color(0XFF2B475E),
              ),
              title: Text(
                '(+20) 100 430 7026',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(
                Icons.email,
                color: Color(0XFF2B475E),
              ),
              title: Text(
                'eng.ahmd.aymn@gmail.com',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/*****Basketball App Section Start*****/
class PointsCounter extends StatefulWidget {
  const PointsCounter({super.key});

  @override
  State<PointsCounter> createState() => _PointsCounterState();
}

class _PointsCounterState extends State<PointsCounter> {
  final GlobalKey<_TeamCounterState> teamAKey = GlobalKey<_TeamCounterState>();
  final GlobalKey<_TeamCounterState> teamBKey = GlobalKey<_TeamCounterState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Points Counter',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TeamCounter(
                teamName: 'A',
                key: teamAKey,
              ),
              SizedBox(
                height: 300,
                child: VerticalDivider(
                  color: Colors.grey,
                  thickness: 0.5,
                  indent: 10,
                ),
              ),
              TeamCounter(
                teamName: 'B',
                key: teamBKey,
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Elevbtn(
              label: 'Reset',
              onPressed: () {
                teamAKey.currentState?.reset();
                teamBKey.currentState?.reset();
              })
        ],
      ),
    );
  }
}

class Elevbtn extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const Elevbtn({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}

class TeamCounter extends StatefulWidget {
  final String teamName;
  const TeamCounter({super.key, required this.teamName});

  @override
  State<TeamCounter> createState() => _TeamCounterState();
}

class _TeamCounterState extends State<TeamCounter> {
  int counter = 0;
  void reset() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Team ${widget.teamName}',
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        Text(
          counter.toString(),
          style: TextStyle(
            fontSize: 64,
          ),
        ),
        Elevbtn(
          label: 'Add 1 Point',
          onPressed: () {
            setState(() {
              counter++;
            });
          },
        ),
        SizedBox(
          height: 10,
        ),
        Elevbtn(
          label: 'Add 2 Point',
          onPressed: () {
            setState(() {
              counter += 2;
            });
          },
        ),
        SizedBox(
          height: 10,
        ),
        Elevbtn(
          label: 'Add 3 Point',
          onPressed: () {
            setState(() {
              counter += 3;
            });
          },
        ),
      ],
    );
  }
}
/*****Basketball App Section End*****/