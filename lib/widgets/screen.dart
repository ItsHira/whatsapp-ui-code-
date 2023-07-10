import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    initialization();
    // TODO: implement initState
    super.initState();
  }

  Future initialization() async {
    await Future.delayed(const Duration(seconds: 4))
        .then((value) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: const Text(
              'Status',
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: LinearPercentIndicator(
                    barRadius: const Radius.circular(10),
                    animation: true,
                    animationDuration: 4000,
                    lineHeight: 6,
                    percent: 1,
                    fillColor: Colors.transparent,
                    progressColor: Colors.grey.shade500,
                    backgroundColor: Colors.grey.shade300,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    height: 540,
                    child: Image.asset(
                      "assets/micky.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
