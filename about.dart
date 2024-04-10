import 'package:flutter/material.dart';
import 'package:mad_project/components/drawer.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 21, 11, 11)),
        backgroundColor: const Color.fromARGB(255, 166, 197, 232),
        title: const Text(
          textAlign: TextAlign.center,
          'About Us',
        ),
      ),
      drawer: const MyDrawer(),
      body: Container(
        color: const Color.fromARGB(255, 166, 197, 232),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(200)),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'About Us',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  textAlign: TextAlign.center,
                  'Our mission is to help those in need by providing essential items such as medicine, equipment, blood, and fresh fruits. We believe in the power of community and collaboration to make a positive impact on people\'s lives.',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
