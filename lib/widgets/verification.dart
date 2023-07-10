import 'dart:async';

import 'package:WHATSAPP/welcome.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class verification extends StatefulWidget {
  final String phone;
  const verification({super.key, required this.phone});

  @override
  State<verification> createState() => _verificationState();
}

class _verificationState extends State<verification> {
  int counter = 30;
  late Timer time;
  void starttime() {
    counter = 30;
    time = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (counter > 0) {
          counter--;
        } else {}
      });
    });
  }

  @override
  void initState() {
    super.initState();
    starttime();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: 450,
              height: 100,
              child: const Text(
                'Verifying your number',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Container(
                // margin: EdgeInsets.only(left: 260),
                alignment: Alignment.center,
                width: 450,
                height: 80,
                child: Text.rich(TextSpan(
                    text: 'Waiting to automatically an SMS send to\n ',
                    style: const TextStyle(fontSize: 17, color: Colors.black),
                    children: <InlineSpan>[
                      TextSpan(
                          text: widget.phone,
                          style: const TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      const TextSpan(
                          text: '   Wrong number?',
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 165, 87, 59))),
                    ]))),
            const SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                  width: 300,
                  child: Pinput(
                    length: 4,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    defaultPinTheme: PinTheme(
                      height: 60.0,
                      width: 60.0,
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          border: Border.all(
                              color: Colors.transparent, width: 1.0)),
                    ),
                  )),
            ]),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.center,
              width: 450,
              height: 50,
              child: const Text(
                'Enter 4-digit code',
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
            Container(
              // margin: EdgeInsets.only(left: 260),
              alignment: Alignment.center,
              width: 450,
              height: 60,
              child: Text.rich(TextSpan(
                  text: '''              Didn't receive code?\n ''',
                  style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: <InlineSpan>[
                    const TextSpan(
                        text: 'you may request a new code in',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                    TextSpan(
                        text: ' $counter',
                        style: const TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 165, 87, 59),
                            fontWeight: FontWeight.normal)),
                  ])),
            ),
            const SizedBox(
              height: 80,
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const welcome1()));
              },
              backgroundColor: Colors.teal,
              child: Icon(
                Icons.adaptive.arrow_forward,
              ),
            )
          ],
        ),
      ),
    );
  }
}
