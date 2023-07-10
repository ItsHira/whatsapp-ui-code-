import 'package:WHATSAPP/widgets/verification.dart';
import 'package:flutter/material.dart';

class verify extends StatelessWidget {
  final String phone;
  const verify({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: verification(
        phone: "      +92$phone",
      ),
    );
  }
}
