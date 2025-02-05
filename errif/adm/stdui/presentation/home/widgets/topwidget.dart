import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:std_ui/presentation/constants/constants.dart';

class WidgetTop extends StatelessWidget {
  WidgetTop(
      {super.key,
      required this.department,
      required this.year,
      required this.totalClassesSum,
      required this.presentSum});
  late String uid;
  late String _uid;
  String? Us;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String department;
  final String year;

  final int totalClassesSum;
  final int presentSum;
    double calculateAttendancePercentage() {
      if (totalClassesSum == 0) {
        return 0.0;
      }
      return (presentSum / totalClassesSum) * 100;
    }
  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;
    _uid = user!.uid;
    Us = user.displayName;
    final Size size = MediaQuery.of(context).size;
  
    final double attendancePercentage = calculateAttendancePercentage();

    return Container(
      width: size.width,
      height: size.height * .34,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 244, 245, 252),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
          bottomRight: Radius.circular(60),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "June 28th",
              style: TextStyle(color: Colors.black.withOpacity(.5)),
            ),
            kheight5,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hey, ",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  "${Us as String}!",
                  style: TextStyle(fontSize: 30),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: Container(
                    width: size.width * .24,
                    height: size.width * .24,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 0, 0).withOpacity(.5),
                      borderRadius: BorderRadius.circular(32),
                      image: const DecorationImage(
                          image: AssetImage(
                              "assets/images/imgdp-removebg-preview.png"),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * .22,
                    height: size.width * .27,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(84, 18, 78, 230),
                            blurRadius: 37,
                            spreadRadius: 10,
                            offset: Offset(15, 25)),
                      ],
                      color: Color.fromARGB(113, 0, 102, 255),
                      borderRadius: BorderRadius.circular(20),
                      //borderr
                      border: Border.all(
                        color: Colors.black.withOpacity(.1),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text(
                         '${attendancePercentage.toStringAsFixed(0)}%',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        Text(
                          "Attendece",
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "${totalClassesSum} ",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "classes",
                        style: TextStyle(
                          color: Colors.black.withOpacity(.4),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "${presentSum}",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Present",
                        style: TextStyle(
                          color: Colors.black.withOpacity(.4),
                        ),
                      ),
                    ],
                  ),
                  Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
