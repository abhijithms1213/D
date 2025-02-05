import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:std_ui/presentation/constants/constants.dart';
import 'package:std_ui/presentation/linechart/line_chart.dart';

class ScreenDiagram extends StatelessWidget {
  const ScreenDiagram({
    super.key,
    required this.subject,
    required this.uid,
    required this.department,
    required this.year,
    required this.attendencePercentage,
    required this.absent,
    required this.present,
  });
  final String subject;
  final String uid;
  final String department;
  final String year;
  final double attendencePercentage;
  final int absent;
  final int present;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 47, 43, 83),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 30.0, top: 30, bottom: 10, right: 20),
          child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                  Spacer(),
                  Container()
                ],
              ),
              kheight20,
              kheight20,
              kheight10,
              Text(
                "Graph",
                style: GoogleFonts.rubik(fontSize: 30, color: Colors.white),
              ),
              SizedBox(
                height: 35,
              ),
              Text("Graph Details",
                  style: GoogleFonts.mukta(
                    fontSize: 25,
                    color: Color.fromARGB(173, 255, 255, 255),
                  )),
              kheight20,
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      //      height: 100,
                      width: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${attendencePercentage.toStringAsFixed(0)}%',
                            style: TextStyle(
                                fontSize: 35,
                                color: Color.fromARGB(173, 255, 255, 255)),
                          ),
                          Text(
                            "Percentage",
                            style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(110, 255, 255, 255)),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      //      height: 100,
                      width: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "$absent",
                            style: TextStyle(
                                fontSize: 35,
                                color: Color.fromARGB(173, 255, 255, 255)),
                          ),
                          Text(
                            "Absent",
                            style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(110, 255, 255, 255)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //  FutureBuilder<DocumentSnapshot>(
              //     future: FirebaseFirestore.instance
              //         .collection('Student')
              //         .doc(department)
              //         .collection(year)
              //         .doc(uid)
              //         .collection('ListOfSub')
              //         .doc(subject)
              //         .get(),
              //     builder: (context, snapshot) {
              //       if (!snapshot.hasData) {
              //         return Center(
              //           child: Text('Document not found'),
              //         );
              //       }

              //       // Access the 'absent' field of the document
              //       var isTotal = snapshot.data?.get('TotalClasses');

              //       // Display the 'absent' field value
              //       return Text('$isTotal');
              //     }),
              Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 20),
                  child: WidgetFlChart(
                    subject: subject,
                    department: department,
                    year: year,
                    uid: uid,
                    absent: absent,
                    attendencePercentage: attendencePercentage,
                    present: present,
                  )),
              Text(
                "in this graph:",
                style: TextStyle(color: Color.fromARGB(99, 255, 255, 255)),
              ),
              kheight5,
              Row(
                children: [
                  kwidth30,
                  Text(
                    "If the graph shows a linear progression, it indicates that you were present in every class.\n Additional information can be found at the bottom section of the graph.",
                    style: TextStyle(color:Color.fromARGB(96, 255, 255, 255), fontSize: 8),
                  ),
                ],
              ),
              kheight5,
              SizedBox(
                height: 40,
                width: size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    kwidth30,
                    Text(
                      "If the graph displays a downward trend,it indicates that you were absent in that particular class.\nFurther details can be observed at the bottom section of the graph.",
                      style: TextStyle(color: Color.fromARGB(96, 255, 255, 255), fontSize: 8),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
