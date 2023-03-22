import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_sample/profile_register_gate.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, user) {
          if (!user.hasData) {
            return const SignInScreen(
              providerConfigs: [
                EmailProviderConfiguration(),
                GoogleProviderConfiguration(clientId: '')
              ],
            );
          }
          return ProfileRegisterGate(uid: user.data!.uid);
        });
  }
}
