import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:the_wall/components/textbox.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final currentuser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 230, 190, 203),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 230, 190, 203),
          title: Center(child: Text('My Profile')),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Icon(
              Icons.person,
              size: 150,
            ),
            Text(
              currentuser.email!,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'User Details',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            textbox(
              option: 'Name',
              text: 'Pratham',
              onPressed: () => edit('name'),
            ),
            textbox(
              option: 'Bio',
              text: 'Hey! I am here',
              onPressed: () => edit('Bio'),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'My Posts',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }

  Future<void> edit(String field) async {}
}
