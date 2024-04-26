import 'package:chat_app/presentation/chat.dart';
import 'package:chat_app/presentation/home.dart';
import 'package:chat_app/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Chat Bot',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      // initialRoute: HomePage.routeName,
      // routes: {

      //   HomePage.routeName: (context) => const HomePage(),
      //   ChatPage.routeName: (context) => const ChatPage(),
      // },
      home: const bottomNavigation(),
    );
  }
}
