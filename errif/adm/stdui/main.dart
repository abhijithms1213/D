import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:std_ui/presentation/home/home.dart';
import 'package:std_ui/presentation/loginpage/login.dart';
import 'package:std_ui/presentation/main/screenmain.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SplashScreen();
        } else {
          return LoginForm();
        }
      },
    ));
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<Map<String, int>> totalValuesFuture;
  late String department = '';
  late String year = '';

  @override
  void initState() {
    super.initState();
    totalValuesFuture = getTotalValues().then((Map<String, dynamic> values)  {
      final int totalClassesSum = values['totalClassesSum'] ?? 0;
      final int totalattendenceSum = values['totalattendenceSum'] ?? 0;
        final CollectionReference teachersList = values['teachersList'];
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenHome(
            totalClassesSum: totalClassesSum,
            totalattendenceSum: totalattendenceSum,
              teachersList: teachersList,
          ),
        ),
      );
      return values as Map<String, int>;
    });
  }

  Future<String?> getYear() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    late String _uid;

    User? user = _auth.currentUser;
    _uid = user!.uid;

    final documentRef =
        FirebaseFirestore.instance.collection('StudentList').doc(_uid);
    final documentSnapshot = await documentRef.get();

    if (documentSnapshot.exists) {
      final data = documentSnapshot.data();
      year = data?['year'] as String;
      department = data?['department'] as String;

      print('Year: $year');
      print('Department: $department');
    } else {
      print('Document does not exist.');
    }
  }

  Future<Map<String, dynamic>> getTotalValues() async {
    await getYear();
    late String _uid;
    final FirebaseAuth _auth = FirebaseAuth.instance;

    User? user = _auth.currentUser;
    _uid = user!.uid;

    final professorRef = FirebaseFirestore.instance
        .collection('Student')
        .doc(department)
        .collection(year)
        .doc(_uid)
        .collection('ListOfSub');

    int totalClassesSum = 0;
    int totalattendenceSum = 0;

    final querySnapshot = await professorRef.get();
    for (final docSnapshot in querySnapshot.docs) {
      final data = docSnapshot.data();
      if (data != null && data.containsKey('TotalClasses')) {
        final totalClasses = data['TotalClasses'] as int?;
        final totalattendence = data['present'] as int?;
        if (totalClasses != null) {
          totalClassesSum += totalClasses;
        }
        if (totalattendence != null) {
          totalattendenceSum += totalattendence;
        }
      }
    }
 final CollectionReference teachersList =
        FirebaseFirestore.instance.collection('Teachers List').doc(department).collection(year);

    print('Total Classes Sum: $totalClassesSum');
    print('Total Attendance Sum: $totalattendenceSum');

    return {
      'totalClassesSum': totalClassesSum,
      'totalattendenceSum': totalattendenceSum,
       'teachersList': teachersList,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final int totalClassesSum;

  HomeScreen({required this.totalClassesSum});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text('Total Classes Sum: $totalClassesSum'),
      ),
    );
  }
}
