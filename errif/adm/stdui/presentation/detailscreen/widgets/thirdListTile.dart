import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';

class WidgetTileThirdFromSubjectPageTotalClasses extends StatelessWidget {
  const WidgetTileThirdFromSubjectPageTotalClasses(
      {super.key,
      required this.subject,
      required this.uid,
      required this.department,
      required this.year,
      required this.size});
  final String subject;
  final String uid;
  final String department;
  final String year;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('Student')
            .doc(department)
            .collection(year)
            .doc(uid)
            .collection('ListOfSub')
            .doc(subject)
            .get(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('Loading'),
            );
          }
          var isPresent = snapshot.data?.get('absent');

          return Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30),
            child: Container(
              width: size.width * .9,
              height: size.height * .15,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 252, 252, 252),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(42, 187, 187, 187),
                      blurRadius: 200,
                      spreadRadius: 21,
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  kwidth10,
                  Text(
                    "Absent",
                    style: GoogleFonts.archivo(
                        color: Color.fromARGB(153, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                        fontSize: 22),
                  ),
                  const Spacer(),
                  Container(
                    width: 70,
                    //  margin: EdgeInsets.all(100.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 6,
                        color: Color.fromARGB(255, 190, 25, 25),
                      ),
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child:  Center(
                      child: Text(
                        "$isPresent",
                        style: TextStyle(
                            color: Color.fromARGB(255, 190, 25, 25),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  kwidth10,
                  kwidth5,
                ],
              ),
            ),
          );
        });
  }
}
