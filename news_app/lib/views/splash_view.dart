/*
File: Splash View
Description: View file for splash screen at the start of the app.
*/

import 'package:flutter/material.dart';
import 'package:news_app/views/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    // Wait for 3 seconds and navigate to the HomeScreen
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Different colors of title
              Text(
                'News',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 28,
                ),
              ),
              Text(
                'Cloud',
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w500,
                  fontSize: 28,
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Center(child: CircularProgressIndicator(color: Colors.orange)),
        ],
      ),
    );
  }
}
