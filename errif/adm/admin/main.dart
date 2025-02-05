import 'package:admin_portal01/presentation/editFromStudent/editstudent.dart';
import 'package:admin_portal01/presentation/editFromTeacher/editteachers.dart';
import 'package:admin_portal01/presentation/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:admin_portal01/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth/login.dart';

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
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home:
          // SCreenEditTeachersByButton(),
         // ems(),
         ScreenMain()
    );
  }
}


//copying flunname to email
class ems extends StatefulWidget {
  const ems({super.key});

  @override
  State<ems> createState() => _emsState();
}

class _emsState extends State<ems> {
  final TextEditingController fullnameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
bool isEmailManuallyEdited = false;
@override
void initState() {
  super.initState();
  fullnameController.addListener(() {
    String fullName = fullnameController.text.trim().toLowerCase();
    String emailPrefix = fullName.replaceAll(' ', '.');
    if (!isEmailManuallyEdited) {
      emailController.text = '$emailPrefix@gmail.com';
    }
  });
}
@override
void dispose() {
  fullnameController.dispose();
  emailController.dispose();
  super.dispose();
}
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
      children: [
        TextFormField(
          key: ValueKey('fullname'),
          controller: fullnameController,
          decoration: InputDecoration(
            hintText: "Enter The Professor Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Enter Full Name';
            } else {
              return null;
            }
          },
        ),
        SizedBox(
          height: 100,
        ),
        TextFormField(
          key: ValueKey('email'),
          controller: emailController,
          decoration: InputDecoration(
            hintText: "Enter The Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty || !value.contains('@')) {
              return 'Please Enter valid Email';
            } else {
              return null;
            }
          },
          onTap: () {
            isEmailManuallyEdited = true;
          },
        ),
      ],
    ),
  );
}
}

void main2() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp2());
}

class MyApp2 extends StatelessWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginForm();
        }
      },
    ));
  }
}
