import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Mypage extends StatelessWidget {
  const Mypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return Container(
                color: Colors.blue, // Blue box color
                padding: const EdgeInsets.all(8.0), // Adjust padding as needed
                margin: const EdgeInsets.symmetric(
                    vertical: 4.0, horizontal: 8.0), // Adjust margin as needed
                child: ListTile(
                  title: Text(data['name']),
                  subtitle: Text(data['email']),

                  // Add more fields as needed
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
