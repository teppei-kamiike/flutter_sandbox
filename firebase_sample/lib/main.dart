import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_sample/auth_gate.dart';
import 'package:firebase_sample/constants/auth_gate_label.dart';
import 'package:firebase_sample/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/i10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Firebase Sample',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.blue,
        ),
        localizationsDelegates: [
          FlutterFireUILocalizations.withDefaultOverrides(const AuthGateLabel())
        ],
        home: const AuthGate());
  }
}
