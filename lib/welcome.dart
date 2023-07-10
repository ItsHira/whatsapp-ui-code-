import 'package:WHATSAPP/widgets/welcome_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const welcome1());

class welcome1 extends StatelessWidget {
  const welcome1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: welcome_p(),
    );
  }
}
