import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore __db = FirebaseFirestore.instance;

 void _signIn() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;
      print("Signed in " + user.displayName);

      
    } catch (e) {
      print(e.message);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.chat_bubble),
            onPressed: () {
              FirebaseFirestore.instance
                  .collection("chats/DKHOOH096tOosJ2uYCIE/msg")
                  .add({"text": "G.M"});
            },
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CupertinoButton.filled(
                  child: Text("Google Signin"),
                  onPressed: () {
                    signInWithGoogle();
                  },
                ),
                SizedBox(height: 30,),
                 CupertinoButton.filled(
                  child: Text("Phone Signin"),
                  onPressed: () {},
                ),
              ],
            ),
          )),
    );
  }
}
