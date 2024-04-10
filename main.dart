import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:mad_project/screens/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyCork6FwYVE4q4RxiKDXdk1FQu2nUJYRXU",
            appId: "1:495381206443:android:feb8780e383e63e789eeee",
            messagingSenderId: "495381206443",
            projectId: "apekshadonation-3cc00",
          ),
        )
      : await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Welcome(),
  ));
}
