import 'package:flutter/src/widgets/framework.dart';
import 'package:the_wall/login.dart';
import 'package:the_wall/register.dart';

class loginsignup extends StatefulWidget {
  const loginsignup({super.key});

  @override
  State<loginsignup> createState() => _loginsignupState();
}

class _loginsignupState extends State<loginsignup> {
  bool showlogin = true;
  void togglepage() {
    setState(() {
      showlogin = !showlogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showlogin) {
      return loginpage(onTap: togglepage);
    } else {
      return registerpage(onTap: togglepage);
    }
  }
}
