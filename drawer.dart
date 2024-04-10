import 'package:flutter/material.dart';
import 'package:mad_project/otherpages/about.dart';
import 'package:mad_project/otherpages/navigation.dart';
import 'package:mad_project/screens/profile.dart';
import 'package:mad_project/screens/welcome.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: Column(
        children: [
          //header
          const DrawerHeader(
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 64,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: const Text(
                style: TextStyle(color: Colors.white),
                'H O M E',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (e) => const Home()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: ListTile(
              leading: const Icon(
                Icons.person_4,
                color: Colors.white,
              ),
              title: const Text(
                style: TextStyle(color: Colors.white),
                'A B O U T U S',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (e) => AboutUs()),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: const Text(
                style: TextStyle(color: Colors.white),
                'P R O F I L E',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (e) => const profile()),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: const Text(
                style: TextStyle(color: Colors.white),
                'S I G N O U T',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (e) => const Welcome()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
