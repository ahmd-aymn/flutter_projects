import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  final Color color;
  final String label;
  final Widget? page;
  const HomeContainer({
    super.key,
    required this.color,
    required this.label,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page!),
          );
        } else {}
      },
      child: Container(
        width: double.infinity,
        height: 65,
        padding: EdgeInsets.all(16),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(color: color),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
