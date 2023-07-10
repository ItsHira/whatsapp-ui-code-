import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

// ignore: camel_case_types
class profile_screen extends StatefulWidget {
  const profile_screen({super.key});

  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            title: const Text("Profile photo"),
            actions: const [
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ))
            ],
            backgroundColor: Colors.transparent,
            leading: BackButton(
              onPressed: () => {
                Navigator.pop(context),
              },
            )),
        body: Center(
          child: SizedBox(
            width: 1200,
            height: 400,
            child: const Image(
              image: AssetImage("assets/micky.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
