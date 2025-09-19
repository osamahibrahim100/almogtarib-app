import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // استدعاء Firebase Core
import 'splash_screen.dart'; // استدعاء شاشة السبلاش

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ضروري قبل Firebase
  await Firebase.initializeApp(); // تهيئة Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
