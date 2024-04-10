import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mad_project/otherpages/about.dart';
import 'package:mad_project/otherpages/contact.dart';
import 'package:mad_project/pages/home.dart';
import 'package:mad_project/screens/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pages = [
    const MyHomePage(),
    ContactUsPage(),
    AboutUs(),
    const profile(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.house_fill,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.phone_fill,
              ),
              label: "Contact"),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.question_square_fill,
              ),
              label: "About Us"),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person_2_fill,
              ),
              label: "Profile"),
        ],
      ),
    );
  }
}
