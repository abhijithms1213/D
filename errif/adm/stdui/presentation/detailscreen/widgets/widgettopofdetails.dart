import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:std_ui/presentation/constants/constants.dart';
import 'package:std_ui/presentation/dropdownbutton/diagramrep.dart';

class WidgetTopOfDetailPage extends StatelessWidget {
  const WidgetTopOfDetailPage(
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
    return Container(
        width: size.width,
        height: size.height * .34,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(112, 18, 78, 230),
                blurRadius: 100,
                spreadRadius: 1,
                offset: Offset(15, 25)),
          ],
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(colors: [
            Color.fromARGB(193, 0, 60, 255),
            Color.fromARGB(154, 172, 163, 253),
          ], begin: Alignment.bottomLeft, end: Alignment.topRight),
        ),
        child: SafeArea(
          child: FutureBuilder<DocumentSnapshot>(
              future: FirebaseFirestore.instance
                  .collection('Student')
                  .doc(department)
                  .collection(year)
                  .doc(uid)
                  .collection('ListOfSub')
                  .doc(subject)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // While waiting for the data to load
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // If an error occurred
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || !snapshot.data!.exists) {
                  // If the document does not exist
                  return Text('Document does not exist');
                }

                // Access the document data
                DocumentSnapshot document = snapshot.data!;
                // Access the fields
                int attendedClasses = document['present'];
                int totalClasses = document['TotalClasses'];
                    int totalabsent = document['absent'];

                // Calculate the percentage
                double percentage = (attendedClasses / totalClasses) * 100;

                // Display the percentage
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * .1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "attendence  ",
                              style: GoogleFonts.rajdhani(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white.withOpacity(.3)),
                            ),
                            Text(
                              '${percentage.toStringAsFixed(0)}%',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white.withOpacity(.9)),
                            ),
                            kwidth30,
                          ],
                        ),
                      ),
                      const Text(
                        "Subject",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      kheight15,
                      Container(
                        width: size.width * .9,
                        height: size.height * .07,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 11, 11, 11)
                                  .withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(
                                  0, 3), // changes the position of the shadow
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            kwidth10,
                            kwidth10,
                            Text(
                              subject,
                              style: GoogleFonts.ubuntu(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ScreenDiagram(subject: subject,department: department,
                                    year: year,uid: uid,
                                    absent: totalabsent,attendencePercentage: percentage,present: attendedClasses,);
                                  },
                                ),
                              );
                            },
                            child: Container(
                              width: size.width * .12,
                              height: size.height * .04,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(250, 255, 255, 255),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 11, 11, 11)
                                        .withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0,
                                        12), // changes the position of the shadow
                                  ),
                                ],
                              ),
                              child: Icon(Icons.expand_more),
                            ),
                          ),
                          kwidth50,
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}
