import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Mylikebtn extends StatelessWidget {
  final bool isliked;
  final Function()? onTap;
  const Mylikebtn({super.key, required this.isliked, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(isliked ? Icons.favorite : Icons.favorite_border,
          color: isliked ? Colors.red : Colors.grey),
    );
  }
}
