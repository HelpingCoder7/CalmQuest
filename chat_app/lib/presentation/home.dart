import 'package:chat_app/presentation/chat.dart';
import 'package:chat_app/presentation/recommentation_page.dart';
import 'package:chat_app/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CalmQuest",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        //get colors from hex
                        Color(0xFFF69170),
                        Color(0xFF7D96E6),
                      ]),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 16.0, left: 16.0),
                          child: (Text("Hey! Lets have a chat",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 16.0, bottom: 16.0),
                          child: (TextButton(
                              onPressed: () {
                                // Navigator.pushNamed(context, '/chat');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChatPage()));
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.black),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.0),
                                child: GradientText(
                                  "Ask Now",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  gradient: LinearGradient(colors: [
                                    Color(0xFFF69170),
                                    Color(0xFF7D96E6),
                                  ]),
                                ),
                              ))),
                        ),
                      ],
                    ),
                    // const Padding(
                    //   padding: EdgeInsets.only(left: 16.0),
                    //   child: DecoratedBox(
                    //     decoration: BoxDecoration(
                    //       image: DecorationImage(
                    //           image: AssetImage("assets/images/icon.png"),
                    //           fit: BoxFit.cover),
                    //     ),
                    //     child: SizedBox(
                    //       height: 150,
                    //       width: 150,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Center(
                    child: Text(
                  "Please chat first to get personalised recommendation",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      leadingDistribution: TextLeadingDistribution.even),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
