import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final double height;
  final double width;
  final ImageProvider image;
  const ProfilePicture(
      {super.key,
      required this.height,
      required this.width,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            image: DecorationImage(image: image, fit: BoxFit.cover)));
  }
}
