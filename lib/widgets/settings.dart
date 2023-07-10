import 'package:WHATSAPP/widgets/profile_screen.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: const Text("Settings"),
            backgroundColor: Colors.teal,
            leading: BackButton(
              onPressed: () => {
                Navigator.pop(context),
              },
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              children: [
                InkWell(
                  onHover: (value) {
                    Colors.blueGrey;
                  },
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const profile_screen())),
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            "assets/micky.jpg",
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Micky",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text("Hey there, I am using Whatsapp",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(),
                const ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(Icons.key),
                  ),
                  title: Text(
                    "Account",
                    style: TextStyle(fontSize: 17),
                  ),
                  subtitle: Text(
                    "Privacy, security. change number",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(Icons.message),
                  ),
                  title: Text(
                    "chats",
                    style: TextStyle(fontSize: 17),
                  ),
                  subtitle: Text(
                    "Privacy, security. change number",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(Icons.notifications),
                  ),
                  title: Text(
                    "Notifications",
                    style: TextStyle(fontSize: 17),
                  ),
                  subtitle: Text(
                    "Messages,group & call tones",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(Icons.circle_outlined),
                  ),
                  title: Text(
                    "Storage and Data",
                    style: TextStyle(fontSize: 17),
                  ),
                  subtitle: Text(
                    "Network usage, auto-Download",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(Icons.help_outline_outlined),
                  ),
                  title: Text(
                    "Help",
                    style: TextStyle(fontSize: 17),
                  ),
                  subtitle: Text(
                    "Help centre, contact us, privacy policy",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                const ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(Icons.people_alt),
                  ),
                  title: Text(
                    "invite a friend",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
