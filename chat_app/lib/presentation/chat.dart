import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:record/record.dart';

class ChatPage extends StatefulWidget {
  static const routeName = '/chat';
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
    _initilize();
  }

  Future<void> _initilize() async {
    var status = await Permission.microphone;

    if (await status.isGranted) {
      print("Access granted");
    } else {
      print("NO ACCESS TO AUDIO");
    }
  }

  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _chatHistory = [];
  bool isRecording = false;
  // final record = AudioRecorder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chat",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            //get max height
            height: MediaQuery.of(context).size.height - 160,
            child: ListView.builder(
              itemCount: _chatHistory.length,
              shrinkWrap: false,
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: 14, right: 14, top: 10, bottom: 10),
                  child: Align(
                    alignment: (_chatHistory[index]["isSender"]
                        ? Alignment.topRight
                        : Alignment.topLeft),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: (_chatHistory[index]["isSender"]
                            ? const Color(0xFFF69170)
                            : Colors.white),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: _chatHistory[index]["isLoading"]
                          ? _startLoader()
                          : Text(_chatHistory[index]["message"],
                              style: TextStyle(
                                  fontSize: 15,
                                  color: _chatHistory[index]["isSender"]
                                      ? Colors.white
                                      : Colors.black)),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: GradientBoxBorder(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFF69170),
                                Color(0xFF7D96E6),
                              ]),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {});
                          },
                          decoration: const InputDecoration(
                            hintText: "Type a message",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8.0),
                          ),
                          controller: _chatController,
                          maxLines: null, // Allow multiple lines of input
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  GestureDetector(
                    onLongPress: () async {
                      if (_chatController.text.isEmpty) {
                        // Start recording audio

                        // if (await record.hasPermission()) {
                        //   // Start recording to file
                        //   // await record.start(const RecordConfig(),
                        //       // path: 'aFullPath/myFile.m4a');
                        //   // ... or to stream
                        //   // final stream =
                        //   //     await record.startStream(const RecordConfig());
                        // }
                        print("Recording audio...");
                      }
                    },
                    onLongPressEnd: (_) async {
                      if (_chatController.text.isEmpty) {
                        // Stop recording audio
                        // Implement your audio stop logic here
                        // Stop recording...
                        // final path = await record.stop();
                        // print("Stopped recording audio..." + path!);
                      }
                    },
                    child: GestureDetector(
                      onLongPressStart: (_) async {
                        if (_chatController.text.isEmpty) {
                          // Start recording audio
                          setState(() {
                            isRecording = true;
                          });

                          // Check and request permission if needed
                          // if (await record.hasPermission()) {
                          // Start recording to file
                          // await record.start(const RecordConfig(),
                          //     path: 'aFullPath/myFile.m4a');
                          // // ... or to stream
                          // final stream =
                          //     await record.startStream(const RecordConfig());
                          // }
                          print("Recording audio...");
                        }
                      },
                      onLongPressEnd: (_) async {
                        if (_chatController.text.isEmpty) {
                          // Stop recording audio
                          setState(() {
                            isRecording = false;
                          });
                          // Stop recording...
                          // final path = await record.stop();
                          // print("Stopped recording audio..." + path!);
                          print("Stopped recording audio...");
                        }
                      },
                      onHorizontalDragUpdate: (details) {
                        if (isRecording && details.delta.dx < 10) {
                          setState(() {
                            isRecording = false;
                          });
                          print("Stopped recording audio by sliding...");
                        }
                      },
                      child: MaterialButton(
                        onPressed: () {
                          setState(() {
                            if (_chatController.text.isNotEmpty) {
                              _chatHistory.add({
                                "time": DateTime.now(),
                                "message": _chatController.text,
                                "isSender": true,
                                "isLoading": false
                              });
                              _chatController.clear();
                              getAnswer();
                            }
                          });
                          _scrollController.jumpTo(
                            _scrollController.position.maxScrollExtent,
                          );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: const EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFFF69170),
                                  Color(0xFF7D96E6),
                                ]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                          ),
                          child: Container(
                            constraints: const BoxConstraints(
                                minWidth: 88.0,
                                minHeight:
                                    36.0), // min sizes for Material buttons
                            alignment: Alignment.center,
                            child: Icon(
                              _chatController.text.isEmpty
                                  ? Icons.mic
                                  : Icons.send,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void getAnswer() async {
    const url =
        "https://generativelanguage.googleapis.com/v1beta2/models/chat-bison-001:generateMessage?key=AIzaSyD5C-Lh-QkwvjHlpd6f7FiJYhlsOd2DLYA";
    final uri = Uri.parse(url);
    List<Map<String, String>> msg = [];
    for (var i = 0; i < _chatHistory.length; i++) {
      msg.add({"content": _chatHistory[i]["message"]});
    }

    var safety_settings = [
      {"category": "HARM_CATEGORY_HARASSMENT", "threshold": "BLOCK_NONE"},
      {"category": "HARM_CATEGORY_HATE_SPEECH", "threshold": "BLOCK_NONE"},
      {
        "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
        "threshold": "BLOCK_NONE"
      },
      {
        "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
        "threshold": "BLOCK_NONE"
      },
    ];

    Map<String, dynamic> request = {
      "prompt": {
        "messages": [msg]
      },
      "temperature": 0.25,
      "candidateCount": 1,
      "topP": 1,
      "topK": 1,
      // "safety_settings": safety_settings
    };
    _startLoader();
    _chatHistory.add({
      "time": DateTime.now(),
      "message": "",
      "isSender": false,
      "isLoading": true
    });
    final response = await http.post(uri, body: jsonEncode(request));
    // _hideLoader();
    print(response.body);
    _chatHistory.removeLast();
    setState(() {
      _chatHistory.add({
        "time": DateTime.now(),
        "message": json.decode(response.body)["candidates"][0]["content"],
        "isSender": false,
        "isLoading": false
      });
    });

    _scrollController.jumpTo(
      _scrollController.position.maxScrollExtent,
    );
  }

  _startLoader() {
    return LoadingAnimationWidget.waveDots(color: Colors.black, size: 25);
  }
}
