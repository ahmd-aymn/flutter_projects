import 'package:flutter/material.dart';

class DefaultContainer extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final double? height;
  final String hint;
  const DefaultContainer({super.key, required this.controller, this.onChanged, this.onTap, this.height = 30, required this.hint});

  @override
  State<DefaultContainer> createState() => _DefaultContainerState();
}

class _DefaultContainerState extends State<DefaultContainer> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: widget.height,
      child: TextField(
        controller: widget.controller,
        cursorColor: Colors.black,
        cursorHeight: 12,
        cursorWidth: 1,
        style: TextStyle(fontSize: 10),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.only(left: 10),
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.black, fontSize: 10),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.circular(30)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0XFFD2691E)), borderRadius: BorderRadius.circular(30)),
        ),
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        onTapOutside: (input)
        {
          setState(() => isActive = false);
          FocusManager.instance.primaryFocus?.unfocus();
        },
      ),
    );
  }
}
