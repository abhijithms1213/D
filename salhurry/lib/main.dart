import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:salhurry/Main/screenmain.dart';
import 'package:salhurry/presentation/login%20page/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
    
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // FirebaseAuth auth = FirebaseAuth.instance;
          if (snapshot.hasData) {
            return  ScreenMain();
            //ScreenHome(auth:auth ,);
          } else {
            return const ScreenLogin();
          }
        },
      ),
        //      initialRoute: '/',

      routes: {
      //  '/': (context) => ScreenMain(),
        '/login': (context) => ScreenLogin(),
      },
    );
  }
}
