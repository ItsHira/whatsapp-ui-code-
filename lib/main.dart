import 'package:WHATSAPP/chats.dart';
import 'package:WHATSAPP/routes.dart';
import 'package:WHATSAPP/signup.dart';
import 'package:WHATSAPP/start.dart';
import 'package:WHATSAPP/verify_no.dart';
import 'package:flutter/material.dart';

late Size mq;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: Routes.splash,
      routes: {
        Routes.splash: (context) => const StartApp(),
        Routes.home: (context) => const chatapp(),
        Routes.signUp: (context) => const signapp(),
        Routes.verification: (context) => const verify(
              phone: '',
            ),
      },
    );
  }
}
