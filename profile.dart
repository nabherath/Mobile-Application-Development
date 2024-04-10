import 'package:flutter/material.dart';
import 'package:mad_project/components/drawer.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  Future<void> editField(String field) async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 166, 197, 232),
        title: Text('PROFILE'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_rounded),
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: ListView(
        children: [
          const SizedBox(height: 50),
          const Icon(
            Icons.person,
            size: 72,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'neth@gmail.com',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(style: TextStyle(color: Colors.white), 'My Details'),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 15,
              bottom: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 166, 197, 232),
            ),
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                        style: TextStyle(color: Colors.white), 'User Name'),
                    IconButton(
                      onPressed: () => editField('User Name'),
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Text(
                  style: TextStyle(color: Colors.white),
                  'Nethmini',
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(style: TextStyle(color: Colors.white), 'Bio'),
                    IconButton(
                      onPressed: () => editField('Bio'),
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Text(
                  style: TextStyle(color: Colors.white),
                  'Reading books',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
