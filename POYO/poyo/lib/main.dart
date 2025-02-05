import 'package:flutter/material.dart';
import 'package:poyo/Presentation/Main/ScreenMain.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255)),
      home: ScreenMain(),
    );
  }
}