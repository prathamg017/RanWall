import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:the_wall/components/drawer.dart';
import 'package:the_wall/components/posts.dart';
import 'package:the_wall/components/textfield.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  TextEditingController message = TextEditingController();
  var currentuser = FirebaseAuth.instance.currentUser;
  void postmessage() {
    if (message.text.isNotEmpty) {
      FirebaseFirestore.instance.collection('UserPosts').add({
        'UserEmail': currentuser!.email,
        'message': message.text,
        'TimeStamp': Timestamp.now(),
        'Likes': []
      });
      print('object');
    }
    setState(() {
      message.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 230, 190, 203),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 104, 86, 100),
          title: Center(child: Text('RanWall')),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: Icon(Icons.logout))
          ],
        ),
        drawer: MyDrawer(),
        body: Center(
            child: Column(children: [
          Expanded(
              child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('UserPosts')
                .orderBy('TimeStamp', descending: false)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: ((context, index) {
                      final post = snapshot.data!.docs[index];
                      return posts(
                        message: post['message'],
                        user: post['UserEmail'],
                        postId: post.id,
                        likes: List<String>.from(post['Likes'] ?? []),
                      );
                    }));
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                Expanded(
                  child: MyTextField(
                    controller: message,
                    hinttext: 'Put your thoughts here..',
                    obscuretext: false,
                  ),
                ),
                IconButton(
                    onPressed: postmessage, icon: Icon(Icons.arrow_upward))
              ],
            ),
          ),
          Text('Logged in as:-' + currentuser!.email!)
        ])));
  }
}
