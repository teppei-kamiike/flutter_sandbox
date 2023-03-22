import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_sample/ui/home_page.dart';
import 'package:firebase_sample/ui/profile_register_page.dart';
import 'package:flutter/material.dart';

class ProfileRegisterGate extends StatefulWidget {
  const ProfileRegisterGate({super.key, required this.uid});

  final String uid;

  @override
  State<ProfileRegisterGate> createState() => _ProfileRegisterGateState();
}

class _ProfileRegisterGateState extends State<ProfileRegisterGate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(widget.uid)
            .get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.data!.exists) return const ProfileRegisterPage();
          return const MyHomePage(
              title: 'Home Page from Profile Register Gate');
        },
      ),
    );
  }
}
