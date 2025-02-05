import 'package:flutter/material.dart';
import 'package:mentor_app/presentation/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        
    
        primarySwatch: Colors.deepPurple
        ),
      debugShowCheckedModeBanner: false,
      home: ScreenHome(),
    );
  }
}
