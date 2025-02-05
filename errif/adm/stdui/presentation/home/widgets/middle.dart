import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:std_ui/presentation/constants/constants.dart';

class WidgetMiddleHome extends StatelessWidget {
  WidgetMiddleHome(
      {super.key,
      required this.department,
      required this.year,
      required this.teachersList,
      required this.teacherName,
      required this.teacherdescription,
      required this.teacherSubject});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _uid;
  final String department;
  final String year;
  final CollectionReference teachersList;
  final String teacherName;
  final String teacherdescription;
  final String teacherSubject;
  String? us;

  Future<String?> getYear() async {
    User? user = _auth.currentUser;
    _uid = user!.uid;
    us = user.displayName;
  }
final listOfImages=['assets/images/miss1.png',
'assets/images/Picsart_23-04-30_20-24-42-537.png',
'assets/images/Picsart_23-04-30_20-24-05-794.png',
'assets/images/Picsart_23-04-30_20-22-39-801.png',
];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
//error is due to this decl
    // final CollectionReference teachersList =
    //     FirebaseFirestore.instance.collection('Teachers List').doc(department).collection(year);
    return SizedBox(
      width: size.width * .7,
      height: size.width * .39,
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: size.width * .7,
              height: size.width * .29,
              decoration: BoxDecoration(
                //color: Color.fromARGB(25, 0, 51, 255),
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(81, 108, 142, 255),
                  Color.fromARGB(19, 255, 255, 255),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                //.withOpacity(.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kheight15,
                    kheight5,
                    Text(
                      teacherName,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    kheight10,
                    Container(
                        // color: Color.fromARGB(23, 0, 51, 255),
                        child: Text(teacherSubject)),
                    kheight10,
                    kheight10,
                    // Container(
                    //   width: size.width * .13,
                    //   height: size.width * .04,
                    //   decoration: BoxDecoration(
                    //     color: Colors.black,
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   child: Center(
                    //     child: Text(
                    //       "Details",
                    //       style: TextStyle(
                    //           color: Colors.white.withOpacity(.7), fontSize: 7),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: size.width * .35,
              height: size.width * .38,
              decoration: BoxDecoration(
                //  color: Color.fromARGB(255, 54, 43, 40),
                image: DecorationImage(
                    image: listOfImages.contains(teacherdescription)
        ? AssetImage("$teacherdescription")
        : AssetImage('assets/images/img5-removebg-preview.png'),
                    fit: BoxFit.fitWidth),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
