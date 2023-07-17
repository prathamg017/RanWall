import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:the_wall/components/buttons.dart';
import 'package:the_wall/components/textfield.dart';

class loginpage extends StatelessWidget {
  final Function()? onTap;
  const loginpage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    TextEditingController mail = TextEditingController();
    TextEditingController password = TextEditingController();

    void displayerror(String message) {
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: Text(message),
              )));
    }

    void login() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
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
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                  GestureDetector(
                    onTap: () {
                      login();
                    },
                    child: MyButton(text: 'Login', onTap: onTap),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Text('Not a member?'),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: onTap,
                          child: Text(
                            'Register',
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
        ),
      ),
    );
  }
}
