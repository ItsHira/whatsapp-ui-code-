import 'package:WHATSAPP/routes.dart';
import 'package:flutter/material.dart';

class StartApp extends StatefulWidget {
  const StartApp({super.key});

  @override
  State<StartApp> createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  @override
  void initState() {
    initialization();
    // TODO: implement initState
    super.initState();
  }

  Future initialization() async {
    await Future.delayed(const Duration(seconds: 5)).then(
        (value) => Navigator.pushReplacementNamed(context, Routes.signUp));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: 50,
              width: 50,
              image: AssetImage('assets/whatsup.png'),
              fit: BoxFit.scaleDown,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "WhatsApp",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
            )
          ],
        ),
      ),
    );
  }
}
