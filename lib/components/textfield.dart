import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final obscuretext;
  final hinttext;
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hinttext,
      required this.obscuretext});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscuretext,
      decoration: InputDecoration(
          hintText: hinttext,
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white12)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white12)),
          fillColor: Color.fromARGB(255, 232, 204, 204),
          filled: true,
          focusColor: Colors.white54),
    );
  }
}
