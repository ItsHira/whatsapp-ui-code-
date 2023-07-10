import 'package:WHATSAPP/chats.dart';
import 'package:flutter/material.dart';

class welcome_p extends StatefulWidget {
  const welcome_p({super.key});

  @override
  State<welcome_p> createState() => _welcome_pState();
}

class _welcome_pState extends State<welcome_p> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 35,
              ),
              const Text(
                'Welcome in Whatsapp',
                style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.teal,
                    letterSpacing: 1.0),
              ),
              const SizedBox(
                height: 60,
              ),
              const SizedBox(
                width: 250,
                height: 250,
                child: Image(image: AssetImage('assets/whats.png')),
              ),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.all(19.0),
                child: Text.rich(TextSpan(
                    text: 'Read our',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    children: <InlineSpan>[
                      TextSpan(
                          text: ' Privacy Policy',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.teal,
                          )),
                      TextSpan(
                          text:
                              '''.Tap "Agree and continue" to\n                     accept the''',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          )),
                      TextSpan(
                          text: ' Terms and Services',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.teal,
                          )),
                    ])),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const chatapp()));
                  print('hello');
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 50,
                  color: Colors.teal,
                  child: const Text('AGREE AND CONTINUE'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
