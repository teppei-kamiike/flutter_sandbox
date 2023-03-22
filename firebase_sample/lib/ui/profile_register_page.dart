import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/entity/user.dart' as app_user;
import 'package:flutter/material.dart';

class ProfileRegisterPage extends StatefulWidget {
  const ProfileRegisterPage({super.key});

  @override
  State<ProfileRegisterPage> createState() => _ProfileRegisterPageState();
}

class _ProfileRegisterPageState extends State<ProfileRegisterPage> {
  String _nickname = '';

  Future<void> _addUser() async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return users.doc(uid).set(app_user.User(nickname: _nickname).toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール登録'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'ニックネーム'),
              onChanged: (value) {
                _nickname = value;
              },
              maxLength: 12,
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
                style: FilledButton.styleFrom(minimumSize: const Size(240, 48)),
                onPressed: () async {
                  _addUser()
                      .then((_) => Navigator.popAndPushNamed(context, '/home'));
                },
                child: const Text('登録'))
          ],
        ),
      ),
    );
  }
}
