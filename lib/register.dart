import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'components/buttons.dart';
import 'components/textfield.dart';

class registerpage extends StatelessWidget {
  final Function() onTap;
  const registerpage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    TextEditingController mail = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController cpassword = TextEditingController();
    void register() async {
      void displayerror(String message) {
        showDialog(
            context: context,
            builder: ((context) => AlertDialog(
                  title: Text(message),
                )));
      }

      if (password.text != cpassword.text) {
        displayerror('Password do not match');
      }

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: mail.text, password: password.text);
      } on FirebaseAuthException catch (e) {
        displayerror(e.code);
      }
    }

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 244, 176, 199),
        body: SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Icon(
                    Icons.lock,
                    size: 200,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'These Random Feelings are Great',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Lets get yourself register',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MyTextField(
                      controller: mail,
                      hinttext: 'Enter your mail..',
                      obscuretext: false),
                  SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                      controller: password,
                      hinttext: 'Enter your Password',
                      obscuretext: true),
                  SizedBox(
                    height: 20,
                  ),
                  MyTextField(
                      controller: cpassword,
                      hinttext: 'Confirm your Password',
                      obscuretext: true),
                  GestureDetector(
                    onTap: () {
                      register();
                    },
                    child: MyButton(
                        text: 'SignUp',
                        onTap: () {
                          onTap;
                        }),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Text('Already a member?'),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  )
                ]),
          ),
        )));
  }
}
