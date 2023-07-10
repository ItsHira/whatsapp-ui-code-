import 'package:WHATSAPP/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Chatcontent extends StatefulWidget {
  final String name, imagePath;
  const Chatcontent({super.key, required this.name, required this.imagePath});

  @override
  State<Chatcontent> createState() => _ChatcontentState();
}

class _ChatcontentState extends State<Chatcontent> {
  final messageTC = TextEditingController();

  List<ChatModel> mychatlist = [
    // ChatModel(msg: 'hi hira '),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.teal, statusBarColor: Colors.teal));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          flexibleSpace: _appbar(widget.name, widget.imagePath),
        ),
        backgroundColor: const Color.fromARGB(255, 184, 254, 238),
        body: Column(children: [
          if (mychatlist.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: mychatlist.length,
                padding: const EdgeInsets.only(top: 1),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return index % 2 == 1
                      ? _bluemsg(mychatlist[index].msg ?? '')
                      : _brownmsg(mychatlist[index].msg ?? '');
                },
              ),
            ),
          if (mychatlist.isEmpty)
            const Expanded(
              child: Center(
                child: Text('Text Here!', style: TextStyle(fontSize: 20)),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.emoji_emotions,
                              color: Color.fromARGB(255, 117, 116, 102),
                              size: 25,
                            )),
                        Expanded(
                            child: TextField(
                          controller: messageTC,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: const InputDecoration(
                              hintText: 'Type Something...',
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 117, 116, 102)),
                              border: InputBorder.none),
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.image,
                              color: Color.fromARGB(255, 117, 116, 102),
                              size: 26,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.camera_alt_rounded,
                              color: Color.fromARGB(255, 117, 116, 102),
                              size: 26,
                            )),
                        const SizedBox(width: 2)
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      mychatlist.add(ChatModel(msg: messageTC.text));
                      messageTC.clear();
                    });
                  },
                  minWidth: 0,
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, right: 5, left: 10),
                  shape: const CircleBorder(),
                  color: Colors.teal,
                  child: const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 28,
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

Widget _appbar(String name, imagePath) {
  return InkWell(
    onTap: () {},
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: CircleAvatar(
            backgroundImage: AssetImage(imagePath),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 2,
            ),
            const Text(
              'Last seen today at 1:42 a.m.',
              style: TextStyle(
                fontSize: 13,
                color: Colors.white,
              ),
            )
          ],
        )
      ],
    ),
  );
}

Widget _bluemsg(String msg) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(
        child: Container(
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 184, 224, 254),
              border: Border.all(color: const Color.fromARGB(255, 2, 83, 137)),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Text(
            msg,
            style: const TextStyle(fontSize: 20, color: Colors.black87),
          ),
        ),
      ),
      const Padding(
          padding: EdgeInsets.only(right: 15),
          child: Text(
            '10:20 PM',
            style: TextStyle(fontSize: 17, color: Colors.black54),
          ))
    ],
  );
}

Widget _brownmsg(String msg) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            '10:20 PM',
            style: TextStyle(fontSize: 17, color: Colors.black54),
          )),
      Flexible(
        child: Container(
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 254, 224, 184),
              border: Border.all(color: Colors.brown),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30))),
          child: Text(
            msg,
            style: const TextStyle(fontSize: 20, color: Colors.black87),
          ),
        ),
      ),
    ],
  );
}
