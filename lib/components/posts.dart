import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:the_wall/components/likebtn.dart';

class posts extends StatefulWidget {
  final String message;
  final String user;
  String postId;
  List<String> likes;
  posts(
      {super.key,
      required this.message,
      required this.user,
      required this.postId,
      required this.likes});

  @override
  State<posts> createState() => _postsState();
}

class _postsState extends State<posts> {
  //user
  final user = FirebaseAuth.instance.currentUser!;
  bool isliked = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isliked = widget.likes.contains(user.email);
  }

  void toggle() {
    setState(() {
      isliked = !isliked;
    });
    DocumentReference docref =
        FirebaseFirestore.instance.collection('UserPosts').doc(widget.postId);

    if (isliked) {
      docref.update({
        'Likes': FieldValue.arrayUnion([user.email])
      });
    } else {
      docref.update({
        'Likes': FieldValue.arrayRemove([user.email])
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 244, 230, 230),
          borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.all(25.00),
      margin: EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Mylikebtn(isliked: isliked, onTap: toggle),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.likes.length.toString(),
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  // textAlign: TextAlign.start,
                  widget.user,
                  style: TextStyle(
                    color: Color.fromARGB(255, 188, 188, 188),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(widget.message)
              ],
            ),
          )
        ],
      ),
    );
  }
}
