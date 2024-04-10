import 'package:flutter/material.dart';
import 'package:mad_project/otherpages/contact.dart';
import 'package:mad_project/screens/admin.dart';
import 'package:mad_project/screens/signin.dart';
import 'package:mad_project/screens/volunteer_sign.dart';

class MySignDrawer extends StatelessWidget {
  const MySignDrawer({super.key});

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
                Icons.group,
                color: Colors.white,
              ),
              title: const Text(
                style: TextStyle(color: Colors.white),
                'V O L U N T E E R  ',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (e) => const VolunteerSignIn()),
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
                'U S E R',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (e) => const SignIn()),
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
                'A D M I N',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (e) => const AdminSignIn()),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: ListTile(
              leading: const Icon(
                Icons.phone,
                color: Colors.white,
              ),
              title: const Text(
                style: TextStyle(color: Colors.white),
                'C O N T A C T U S',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (e) => ContactUsPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
