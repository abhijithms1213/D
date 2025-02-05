import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:std_ui/presentation/constants/constants.dart';
import 'package:std_ui/presentation/detailscreen/widgets/firstlisttile.dart';
import 'package:std_ui/presentation/detailscreen/widgets/secondlistTile.dart';
import 'package:std_ui/presentation/detailscreen/widgets/thirdListTile.dart';
import 'package:std_ui/presentation/detailscreen/widgets/widgettopofdetails.dart';
import 'package:std_ui/presentation/linechart/line_chart.dart';

class ScreenDetailedOfSubject extends StatelessWidget {
  const ScreenDetailedOfSubject(
      {super.key,
      required this.subject,
      required this.uid,
      required this.department,
      required this.year});
  final String subject;
  final String uid;
  final String department;
  final String year;
  
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final CollectionReference details = FirebaseFirestore.instance
        .collection('Student')
        .doc(department)
        .collection(year)
        .doc(uid)
        .collection('ListOfSub');
    //   DocumentSnapshot document = snapshot.data.doc[''];
    return Scaffold(
      backgroundColor: Color.fromARGB(228, 255, 255, 255),
      //  backgroundColor: Colors.black87,
      body: Column(
        children: [
          WidgetTopOfDetailPage(
             size: size,
                  uid: uid,
                  department: department,
                  year: year,
                  subject: subject,
          ),
          LimitedBox(
            maxHeight: size.height * .64,
            child: ListView(
              children: [
                WidgetTileOneFromSubjectPageTotalClasses(
                  size: size,
                  uid: uid,
                  department: department,
                  year: year,
                  subject: subject,
                ),
                kheight20,
                WidgetTileTwoFromSubjectPageTotalClasses(
                 size: size,
                  uid: uid,
                  department: department,
                  year: year,
                  subject: subject,
                ),
                kheight20,
                WidgetTileThirdFromSubjectPageTotalClasses(
                 size: size,
                  uid: uid,
                  department: department,
                  year: year,
                  subject: subject,
                ),
                kheight20,
                //WidgetFlChart()
              ],
            ),
          )
        ],
      ),
    );
  }
}
