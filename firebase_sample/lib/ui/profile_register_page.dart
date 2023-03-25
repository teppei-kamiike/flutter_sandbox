import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/entity/user.dart' as app_user;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRegisterPage extends StatefulWidget {
  const ProfileRegisterPage({super.key});

  @override
  State<ProfileRegisterPage> createState() => _ProfileRegisterPageState();
}

class _ProfileRegisterPageState extends State<ProfileRegisterPage> {
  String _nickname = '';
  final ImagePicker _imagePicker = ImagePicker();
  File? _icon;
  String? _iconDownloadUrl;
  late final FocusNode _entireFocusNode;
  bool _inputEnable = true;

  @override
  void initState() {
    super.initState();
    _entireFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _entireFocusNode.dispose();
    super.dispose();
  }

  Future<void> _uploadIconFile() async {
    if (_icon == null) return;
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    final storageRef = FirebaseStorage.instance.ref('users/$uid/profile_icon');
    await storageRef.putFile(_icon!);
    _iconDownloadUrl = await storageRef.getDownloadURL();
  }

  Future<void> _addUser() async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    return users.doc(uid).set(
        app_user.User(nickname: _nickname, iconDownloadUrl: _iconDownloadUrl)
            .toJson());
  }

  void _unfocusNickname() {
    final FocusScopeNode currentScope = FocusScope.of(context);
    if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: _unfocusNickname,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('プロフィール登録'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: _icon != null ? FileImage(_icon!) : null,
                    radius: 40,
                    child: _icon == null ? const Text('No image') : null,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  _icon == null
                      ? OutlinedButton(
                          onPressed: _inputEnable
                              ? () async {
                                  _unfocusNickname();
                                  final XFile? pickedIcon = await _imagePicker
                                      .pickImage(source: ImageSource.gallery);
                                  if (pickedIcon == null) return;
                                  setState(() {
                                    _icon = File(pickedIcon.path);
                                  });
                                }
                              : null,
                          child: const Text('画像をアップロード'),
                        )
                      : OutlinedButton(
                          onPressed: _inputEnable
                              ? () {
                                  _unfocusNickname();
                                  setState(() {
                                    _icon = null;
                                  });
                                }
                              : null,
                          child: const Text('削除'),
                        ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'ニックネーム'),
                onChanged: (value) {
                  _nickname = value;
                },
                enabled: _inputEnable,
                maxLength: 12,
              ),
              const SizedBox(
                height: 20,
              ),
              FilledButton(
                style: FilledButton.styleFrom(minimumSize: const Size(240, 48)),
                onPressed: _inputEnable
                    ? () async {
                        _unfocusNickname();
                        _inputEnable = false;

                        await _uploadIconFile();
                        _addUser().then(
                          (_) => Navigator.popAndPushNamed(context, '/home'),
                        );
                      }
                    : null,
                child: _inputEnable
                    ? const Text('登録')
                    : const CircularProgressIndicator(
                        strokeWidth: 2.0,
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
