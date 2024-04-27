// ignore_for_file: prefer_const_construc
import 'package:chat_app/presentation/community.dart';
import 'package:chat_app/presentation/home.dart';
import 'package:chat_app/presentation/musicScreen.dart';
import 'package:chat_app/presentation/appointment.dart';
import 'package:chat_app/presentation/recommentation_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bottomNavigation extends StatefulWidget {
  const bottomNavigation({super.key});

  @override
  State<bottomNavigation> createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {
  int selectedIndex = 0;
  var screens = [
    const HomePage(),
    Recommendation(),
    SongsApp(),
    DoctorList(
      doctors: [
        DoctorCard(
          imageUrl:
              "https://cdn.pixabay.com/photo/2024/03/29/03/30/ai-generated-8662131_960_720.png",
          doctorName: "Yash Pathak",
          availability: "Availabel",
          address: 'Dabra',
        ),
        DoctorCard(
          imageUrl:
              "https://cdn.pixabay.com/photo/2024/03/29/03/30/ai-generated-8662131_960_720.png",
          doctorName: "Sudarshan Shrivastava",
          availability: "Availabel",
          address: 'Gwalior',
        ),
        DoctorCard(
          imageUrl:
              "https://cdn.pixabay.com/photo/2024/03/29/03/30/ai-generated-8662131_960_720.png",
          doctorName: "Anishit Mishra",
          availability: "Availabel",
          address: 'Murena',
        ),
        DoctorCard(
          imageUrl:
              "https://cdn.pixabay.com/photo/2024/03/29/03/30/ai-generated-8662131_960_720.png",
          doctorName: "Shradha gurjar",
          availability: "Availabel",
          address: 'Agra',
        ),
      ],
    ),
  ];

  var homeIcon = Icon(
    Icons.home,
    fill: 0,
  );
  var profileIcon = Icon(
    CupertinoIcons.profile_circled,
    fill: 0,
  );
  var musicIcon = Icon(
    Icons.music_note_rounded,
    fill: 0,
  );
  var notificationIcon = Icon(
    CupertinoIcons.arrow_branch,
    fill: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   shape: CircleBorder(),
      //   onPressed: () => {},
      //   backgroundColor: Color.fromRGBO(146, 163, 253, 1),
      //   child: SvgPicture.asset('assets/Icons/search_icon.svg'),
      // ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.all(20.0),
        

        // shape: ConvexNotchedRectangle(
        //   notchSmoothness: NotchSmoothness.smoothEdge,
        // ),
        // color: Colors.white,
        // elevation: 10,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          GestureDetector(
              onTap: () {
                selectedIndex = 0;
                homeIcon = Icon(
                  Icons.home,
                  fill: 1,
                );
                // musicIcon = Icon(Icons.music_note, fill: 0);
                // profileIcon = Icon(CupertinoIcons.profile_circled, fill: 0);
                // notificationIcon = Icon(CupertinoIcons.arrow_branch, fill: 0);
                setState(() {});
              },
              child: homeIcon),
          GestureDetector(
            child: notificationIcon,
            onTap: () {
              selectedIndex = 1;

              setState(() {});
            },
          ),
          GestureDetector(
            child: musicIcon,
            onTap: () {
              selectedIndex = 2;

              setState(() {});
            },
          ),
          GestureDetector(
              onTap: () {
                selectedIndex = 3;

                setState(() {});
              },
              child: profileIcon),
        ]),
      ),
    );
  }
}
