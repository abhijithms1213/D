import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:std_ui/presentation/constants/constants.dart';
import 'package:std_ui/presentation/detailscreen/detailed.dart';
import 'package:std_ui/presentation/home/widgets/middle.dart';
import 'package:std_ui/presentation/home/widgets/scrollingtile.dart';
import 'package:std_ui/presentation/home/widgets/topwidget.dart';
import 'package:std_ui/presentation/loginpage/login.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome(
      {super.key,
      required this.totalClassesSum,
      required this.totalattendenceSum,
      required this.teachersList});
  final int totalClassesSum;
  final int totalattendenceSum;
  final CollectionReference teachersList;
  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _uid;
  late String department = '';
  late String year = '';
  // late String _name;
  String? us;
  // int totalClassesSum = 2;
  int presentSum = 0;

  Future<String?> getYear() async {
    User? user = _auth.currentUser;
    _uid = user!.uid;
    us = user.displayName;
    print(user.uid);
    final documentRef =
        FirebaseFirestore.instance.collection('StudentList').doc(_uid);
    final documentSnapshot = await documentRef.get();
    // final data = documentSnapshot.data();
    if (documentSnapshot.exists) {
      final data = documentSnapshot.data();
      year = data?['year'] as String;
      department = data?['department'] as String;

      print('Year: $year');
      print('Department: $department');

      return year;
    } else {
      print('Document does not exist.');
      return null;
    }
  }

  late Future<int> totalClassesSumFuture;
  bool departmentExists = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalClassesSumFuture = addValues();
    //  Future.delayed(const Duration(seconds: 00001), () {
    //   addValues();
    // });
    getYear();

    checkIfDepartmentExists();
    Future.delayed(const Duration(seconds: 00001), () {
      saveDepartmentExists();
    });
  }

  void saveDepartmentExists() async {
    try {
      final professorRef = FirebaseFirestore.instance
          .collection('Student')
          .doc(department)
          .collection(year)
          .doc(_uid);

      final departmentRef = professorRef.collection('ListOfSub');
      final departmentSnapshot = await departmentRef.get();
      setState(() {
        departmentExists = departmentSnapshot.docs.isNotEmpty;
      });
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<bool> checkIfDepartmentExists() async {
    try {
      final professorRef = FirebaseFirestore.instance
          .collection('Student')
          .doc(department)
          .collection(year)
          .doc(_uid);

      final departmentRef = professorRef.collection('ListOfSub');
      final departmentSnapshot = await departmentRef.get();
      return departmentSnapshot.docs.isNotEmpty;
    } catch (LateInitializationError) {
      print('Error: ');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    late bool departmentExists;
    return Scaffold(
      //   backgroundColor: Color.fromARGB(24, 127, 212, 251),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetTop(
              department: department,
              year: year,
              totalClassesSum: widget.totalClassesSum,
              presentSum: widget.totalattendenceSum,
            ),
            kheight10,
            Stack(
              children: [
                Row(
                  children: [
                    kwidth10,
                    const Text(
                      "Our Professors",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20),
                    child: Container(
                      height: size.width * .4,
                      child: Expanded(
                        child: StreamBuilder<QuerySnapshot>(
                          stream: widget.teachersList.snapshots(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (!snapshot.hasData) {
                              return CircularProgressIndicator();
                            }

                            final teachers = snapshot.data!.docs;

                            return ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  final DocumentSnapshot donorsnap =
                                      snapshot.data.docs[index];
                                  final teacherData = teachers[index].data();
                                  final teacherName =
                                      teacherData['name'] as String;
                                  final teacherSubject =
                                      teacherData['subject'] as String;
                                  final teacherDescription =
                                      teacherData['description'] as String;

                                  return
                                      //Text(teacherSubject ?? '');
                                      WidgetMiddleHome(
                                    department: department,
                                    year: year,
                                    teachersList: widget.teachersList,
                                    teacherName: teacherName,
                                    teacherSubject: teacherSubject,
                                    teacherdescription: teacherDescription,
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    width: 1,
                                    height: 1,
                                  );
                                },
                                itemCount: snapshot.data!.docs.length);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            kheight10,
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Check Your Attendence",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
            kheight10,
            const Padding(
              padding: EdgeInsets.only(left: 13.0),
              child: Text(
                "this is a list which refers to all subjects",
                style: TextStyle(fontSize: 10, color: Colors.black12),
              ),
            ),
            kheight20,
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: FutureBuilder<bool>(
                future: checkIfDepartmentExists(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    departmentExists = snapshot.data ?? false;
                    if (departmentExists) {
                      final CollectionReference professorRef = FirebaseFirestore
                          .instance
                          .collection('Student')
                          .doc(department)
                          .collection(year)
                          .doc(_uid)
                          .collection('ListOfSub');
                      return SizedBox(
                        height: size.height * .15,
                        child: StreamBuilder(
                          stream: professorRef.snapshots(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final DocumentSnapshot professorRefSnap =
                                        snapshot.data.docs[index];
                                    return InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return ScreenDetailedOfSubject(subject:   professorRefSnap['subject'] as String,uid: _uid,department: department,year: year,);
                                            },
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width: size.width * .55,
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/bgg5.jpg"),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              professorRefSnap['subject'],
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      width: 20,
                                    );
                                  },
                                  itemCount: snapshot.data!.docs.length);
                            }
                            return Container();
                          },
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text(
                            'The collection "department" does not exist!/Loading...'),
                      );
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(167, 58, 130, 255),
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginForm(),
            ),
          );
        },
        child: const Icon(
          Icons.logout,
        ),
      ),
    );
  }

  Future<int> addValues() async {
    final professorRef = FirebaseFirestore.instance
        .collection('Student')
        .doc(department)
        .collection(year)
        .doc(_uid)
        .collection('ListOfSub');

    int totalClassesSum = 0;

    final querySnapshot = await professorRef.get();
    for (final docSnapshot in querySnapshot.docs) {
      final data = docSnapshot.data();
      if (data != null && data.containsKey('TotalClasses')) {
        final totalClasses = data['TotalClasses'] as int?;
        if (totalClasses != null) {
          totalClassesSum += totalClasses;
        }
      }
    }
    print('Total Classes Sum: $totalClassesSum');

    return totalClassesSum;
  }
}
//code ofaddValues
// final professorRef = FirebaseFirestore.instance
//     .collection('Student')
//     .doc(department)
//     .collection(year!)
//     .doc(_uid)
//     .collection('ListOfSub');

// int totalClassesSum = 0;

// final querySnapshot = await professorRef.get();
// for (final docSnapshot in querySnapshot.docs) {
//   final data = docSnapshot.data();
//   if (data != null && data.containsKey('TotalClasses')) {
//     final totalClasses = data['TotalClasses'] as int?;
//     if (totalClasses != null) {
//       totalClassesSum += totalClasses;
//     }
//   }
// }

// print('Total Classes Sum: $totalClassesSum');
