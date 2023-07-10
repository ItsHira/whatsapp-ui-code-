import 'dart:io';

import 'package:WHATSAPP/chat_content.dart';
import 'package:WHATSAPP/model/chat_model.dart';
import 'package:WHATSAPP/widgets/screen.dart';
import 'package:WHATSAPP/widgets/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class chatapp extends StatefulWidget {
  const chatapp({super.key});

  @override
  State<chatapp> createState() => _chatappState();
}

class _chatappState extends State<chatapp> {
  final picker = ImagePicker();
  Future getImage() async {
    // ignore: deprecated_member_use
    final pickerImage = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickerImage != null) {
      } else {
        print('No image found....!');
      }
    });
  }

  List<ChatListModel> mychatList = [
    ChatListModel(
      name: 'Pikachu',
      imagePath: 'assets/pikachu.png',
      lastSeen: 'Last seen today at 1:42 a.m.',
      lastMessage: 'hey!',
      messageTime: '6:34 AM',
    ),
    ChatListModel(
      name: 'Tom',
      imagePath: 'assets/tom.jpg',
      lastSeen: 'Last seen today at 1:42 a.m.',
      lastMessage: 'yeah!',
      messageTime: '6:35 AM',
    ),
    ChatListModel(
      name: 'Doremone',
      imagePath: 'assets/doremone.png',
      lastSeen: 'Last seen today at 4:42 a.m.',
      lastMessage: 'How r you?',
      messageTime: 'Yesterday',
    ),
    ChatListModel(
      name: 'Jerry',
      imagePath: 'assets/erry.png',
      lastSeen: 'Last seen yesterday at 3:12 a.m.',
      lastMessage: 'Fine!',
      messageTime: '8:34 AM',
    ),
    ChatListModel(
      name: 'Tweety',
      imagePath: 'assets/tweety.jpg',
      lastSeen: 'Last seen today at 11:42 a.m.',
      lastMessage: 'hey!',
      messageTime: '10:34 PM',
    ),
    ChatListModel(
      name: 'Dora',
      imagePath: 'assets/dora.webp',
      lastSeen: 'Last seen today at 5:49 a.m.',
      lastMessage: 'hello!',
      messageTime: '7:11 PM',
    ),
    ChatListModel(
      name: 'Sponge',
      imagePath: 'assets/spong.png',
      lastSeen: 'Last seen yesterday at 9:42 a.m.',
      lastMessage: 'hey!',
      messageTime: '1:24 AM',
    ),
    ChatListModel(
      name: 'Pinky',
      imagePath: 'assets/pinky.webp',
      lastSeen: 'Last seen today at 12:02 a.m.',
      lastMessage: 'Whatsup!',
      messageTime: '1:34 PM',
    ),
    ChatListModel(
      name: 'Bunny',
      imagePath: 'assets/bunny.jpg',
      lastSeen: 'Last seen yesterday at 6:13 a.m.',
      lastMessage: 'nothing!',
      messageTime: '3:34 AM',
    ),
  ];
  final searchTC = TextEditingController();
  // final List _list = [];
  // final List _searchList = [];
  bool _isSearching = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: WillPopScope(
            onWillPop: () {
              if (_isSearching) {
                setState(() {
                  _isSearching = !_isSearching;
                });
                return Future.value(false);
              } else {
                return Future.value(true);
              }
            },
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: _isSearching
                    ? TextField(
                        controller: searchTC,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Contact',
                            hintStyle: TextStyle(
                              fontSize: 20,
                            )),
                        autofocus: true,
                        style: const TextStyle(letterSpacing: 1, fontSize: 17),
                        onChanged: (val) {
                          setState(() {});
                        },
                      )
                    : const Text('WhatsApp',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                bottom: const TabBar(tabs: [
                  Tab(
                    child: Text('Chats'),
                  ),
                  Tab(
                    child: Text('Status'),
                  ),
                  Tab(
                    child: Text('Calls'),
                  ),
                ]),
                actions: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isSearching = !_isSearching;
                      });
                    },
                    icon: Icon(_isSearching
                        ? CupertinoIcons.clear_circled_solid
                        : Icons.search),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  PopupMenuButton(
                      icon: const Icon(Icons.more_vert_outlined),
                      itemBuilder: (
                        context,
                      ) =>
                          [
                            PopupMenuItem(
                                value: 1,
                                child: InkWell(
                                    onTap: () => {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Setting()))
                                        },
                                    child: const Text('Settings'))),
                            PopupMenuItem(
                                value: 2,
                                child: InkWell(
                                    onTap: () => {exit(0)},
                                    child: const Text('LogOut')))
                          ]),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
              backgroundColor: const Color.fromARGB(255, 234, 234, 234),
              floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: FloatingActionButton(
                  onPressed: () {
                    getImage();
                  },
                  child: const Icon(Icons.camera_alt_rounded),
                ),
              ),
              body: TabBarView(
                children: [
                  //---------------------------------------------------

                  //------------------------------------------------
                  SingleChildScrollView(
                    child: Column(children: [
                      ...mychatList.asMap().entries.map((e) {
                        if (mychatList[e.key]
                            .name!
                            .toLowerCase()
                            .contains(searchTC.text.toLowerCase())) {
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 4),
                            color: const Color.fromARGB(255, 184, 254, 238),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            elevation: 0.5,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Chatcontent(
                                              name: e.value.name ?? '',
                                              imagePath:
                                                  e.value.imagePath ?? '',
                                            )));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(e.value.imagePath ?? ''),
                                ),
                                title: Text(e.value.name ?? ''),
                                subtitle: Text(e.value.lastMessage ?? ''),
                                trailing: Text(e.value.messageTime ?? ''),
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      }).toList(),
                    ]),
                  ),

                  // /status--------------------------------------------------
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              children: [
                                InkWell(
                                  hoverColor:
                                      const Color.fromARGB(255, 184, 254, 238),
                                  onTap: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Screen())),
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(1.5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: Colors.grey, width: 3),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.asset(
                                        'assets/micky.jpg',
                                        height: 55,
                                        width: 55,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Column(
                                    children: [
                                      Text(
                                        'My Status',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        '      Today, 12 30 am',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54),
                                      )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  child: const Icon(
                                    Icons.more_vert,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Recent Updates",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                          InkWell(
                            hoverColor:
                                const Color.fromARGB(255, 184, 254, 238),
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Screen())),
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(children: [
                                Container(
                                  padding: const EdgeInsets.all(1.5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                        color: Colors.teal, width: 4),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.asset(
                                      'assets/erry.png',
                                      height: 55,
                                      width: 55,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Jerry',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        '   Today, 21:56',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          InkWell(
                            hoverColor:
                                const Color.fromARGB(255, 184, 254, 238),
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Screen())),
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(1.5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: Colors.teal, width: 4),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.asset(
                                        'assets/spong.png',
                                        height: 55,
                                        width: 55,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Column(
                                      children: [
                                        Text(
                                          '  Spong',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'Today, 20:26',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Viewd Updates",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ),
                          InkWell(
                            hoverColor:
                                const Color.fromARGB(255, 184, 254, 238),
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Screen())),
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(children: [
                                Container(
                                  padding: const EdgeInsets.all(1.5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                        color: Colors.grey, width: 3),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.asset(
                                      'assets/pikachu.png',
                                      height: 55,
                                      width: 55,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Column(
                                    children: [
                                      Text(
                                        '    Pikachu',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Yesterday, 15:26',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          InkWell(
                            hoverColor:
                                const Color.fromARGB(255, 184, 254, 238),
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Screen())),
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(1.5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: Colors.grey, width: 3),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.asset(
                                        'assets/tom.jpg',
                                        height: 55,
                                        width: 55,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Column(
                                      children: [
                                        Text(
                                          '   Tom',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          'Yesterday, 21:56',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            hoverColor:
                                const Color.fromARGB(255, 184, 254, 238),
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Screen())),
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(children: [
                                Container(
                                  padding: const EdgeInsets.all(1.5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                        color: Colors.grey, width: 3),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.asset(
                                      'assets/doremone.png',
                                      height: 55,
                                      width: 55,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Doremone',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        '      Yesterday, 22:56',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          InkWell(
                            hoverColor: Colors.teal,
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Screen())),
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(1.5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: Colors.grey, width: 3),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.asset(
                                        'assets/bunny.jpg',
                                        height: 55,
                                        width: 55,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Bunny',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          '      Yesterday, 23:26',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            hoverColor:
                                const Color.fromARGB(255, 184, 254, 238),
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Screen())),
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(children: [
                                Container(
                                  padding: const EdgeInsets.all(1.5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                        color: Colors.grey, width: 3),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.asset(
                                      'assets/pinky.webp',
                                      height: 55,
                                      width: 55,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Pinky',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        '      Yesterday, 20:00',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black54),
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          InkWell(
                            hoverColor:
                                const Color.fromARGB(255, 184, 254, 238),
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Screen())),
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(1.5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: Colors.grey, width: 3),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(40),
                                      child: Image.asset(
                                        'assets/dora.webp',
                                        height: 55,
                                        width: 55,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Dora',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          '      Yesterday, 22:22',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //calls--------------------------------------------------
                  ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const CircleAvatar(
                            backgroundImage: AssetImage('assets/pikachu.png'),
                          ),
                          title: Text(index / 2 == 0 ? 'pikachu' : 'piku'),
                          subtitle: Text(index / 2 == 0
                              ? 'you missed audio call'
                              : 'call times is 12:23'),
                          trailing: Icon(
                              index / 2 == 0 ? Icons.phone : Icons.video_call),
                        );
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
