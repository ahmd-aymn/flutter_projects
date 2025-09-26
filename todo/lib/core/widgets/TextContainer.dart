import 'package:flutter/material.dart';
import 'DefaultContainer.dart';

class TextContainer extends StatefulWidget {
  final String label;
  final String hint;
  final double? width;
  final double? height;
  final Color borderColor;
  final TextEditingController? textController;
  const TextContainer(
      {super.key,
      required this.label,
      required this.hint,
      this.textController,
      this.width = 331,
      this.height = 63,
      this.borderColor = Colors.white});

  @override
  State<TextContainer> createState() => _TextContainerState();
}

class _TextContainerState extends State<TextContainer> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return DefaultContainer(
      width: widget.width,
      height: widget.height,
      bordercolor: isTapped ? widget.borderColor : Colors.grey,
      child: TextFormField(
        onTap: () {
          setState(() {
            isTapped = true; // Update state when tapped
          });
        },
        onFieldSubmitted: (value) {
          setState(() {
            isTapped = false; // Update state when tapped
          });
        },
        controller: widget.textController,
        style: TextStyle(fontSize: 14),
        cursorColor: Colors.black,
        cursorHeight: 14,
        cursorWidth: 1,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 5),
            label: Text(widget.label,
                style: TextStyle(color: Color(0XFF6E6A7C), fontSize: 10)),
            hintText: widget.hint,
            hintStyle: TextStyle(fontSize: 14),
            fillColor: Colors.white,
            border: InputBorder.none),
      ),
    );
  }
}

/*DefaultContainer(
      width: width,
      height: height,
      bordercolor: AppColors.white,
      child: InkWell(
        child: TextFormField(controller: textController, style: TextStyle(fontSize: 14),
          cursorColor: Colors.black,
          cursorHeight: 14,
          cursorWidth: 1,
          decoration: InputDecoration(contentPadding: EdgeInsets.only(top: 5),
              label: Text(label, style: TextStyle(color: Color(0XFF6E6A7C), fontSize: 10)),
              hintText: hint,
              hintStyle: TextStyle(fontSize: 14),
              fillColor: Colors.white,
              border: InputBorder.none),
        ),
      ),

    );*/

/*final String label;
  final String hint;
  double? width;
  double? height;
  final TextEditingController? textController;*/
