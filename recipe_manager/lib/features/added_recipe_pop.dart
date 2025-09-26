import 'package:flutter/material.dart';

class AddedRecipePop extends StatelessWidget {
  const AddedRecipePop({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0XFFFFF8DC),
      content: SizedBox(height: 100,
      child: Column(
        children: [
          Text("Recipe added successfully", style: TextStyle(color: Color(0XFFD2691E), fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'Arial')),
          Expanded(child: TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text('Close', style: TextStyle(color: Color(0XFFD2691E), fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'Arial'))))
        ],
      )),
    );
  }
}
