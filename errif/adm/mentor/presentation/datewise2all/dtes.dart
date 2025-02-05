import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../addbuttonattendencepage/addbuttonattendence.dart';
import '../attendencesee/atndnceseefromperiodpage.dart';
import '../datewise/widgets/listtile.dart';

class ScreenDateAllSecond extends StatefulWidget {
  const ScreenDateAllSecond({super.key, required this.yr, required this.dept});

  final String yr;
  final String dept;

  @override
  State<ScreenDateAllSecond> createState() => _ScreenDateAllSecondState();
}

class _ScreenDateAllSecondState extends State<ScreenDateAllSecond> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final widthofscreen = MediaQuery.of(context).size.width;
    final heightofscreen = MediaQuery.of(context).size.height;
    User? user = FirebaseAuth.instance.currentUser;
    String userId = '';
      late String fullyDate2 = '31 5 2023';
    final CollectionReference dptYears = FirebaseFirestore.instance
        .collection('professor')
        .doc(userId)
        .collection('department')
        .doc(widget.dept)
        .collection(widget.dept)
        .doc(widget.yr)
        .collection('date');
    final CollectionReference periodList = FirebaseFirestore.instance
        .collection('professor')
        .doc(userId)
        .collection('department')
        .doc(widget.dept)
        .collection(widget.dept)
        .doc(widget.yr)
        .collection('date')
        .doc(fullyDate2)
        .collection('periods');
    if (user != null) {
      userId = user.uid;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "select",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //top
          Container(
            height: heightofscreen * .22,
            width: widthofscreen,
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: heightofscreen * .09,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SizedBox(
                    width: widthofscreen,
                    height: widthofscreen * .16,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: dptYears.orderBy('month').snapshots(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container();
                        }

                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Text('No collections found.');
                        }

                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot dptYearssnap =
                                snapshot.data.docs[index];
                            final isSelected = selectedIndex ==
                                index; // Check if the item is selected
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: SizedBox(
                                //   color:  isSelected ? Colors.white : Colors.black,
                                width: widthofscreen * 0.15,
                                height: heightofscreen * 0.01,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dptYearssnap['monthName'],
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.white38,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${dptYearssnap['day']}',
                                      style: TextStyle(
                                        fontSize: 35.0,
                                        color: isSelected
                                            ? Colors.white
                                            : Color.fromARGB(
                                                159, 255, 255, 255),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Container(
                              width: widthofscreen * 0.05,
                            );
                          },
                          itemCount: snapshot.data!.docs.length,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: heightofscreen * .02,
                ),
                Container(
                  height: heightofscreen * .03,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //widgetDown
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Period: day',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: SizedBox(
                    height: heightofscreen * .5,
                    // child: StreamBuilder(
                    //   stream: periodList.snapshots(),
                    //   builder: (context, AsyncSnapshot snapshot) {
                    //     if (snapshot.hasData) {
                    //       return ListView.separated(
                    //           scrollDirection: Axis.vertical,
                    //           itemBuilder: (context, index) {
                    //             final DocumentSnapshot dptYrsnap =
                    //                 snapshot.data.docs[index];
                    //             return InkWell(
                    //               onTap: () {
                    //                 Navigator.of(context).push(
                    //                   MaterialPageRoute(
                    //                     builder: (context) {
                    //                       return ScreenAttendenceDetails();
                    //                     },
                    //                   ),
                    //                 );
                    //               },
                    //               child: Container(
                    //                 width: widthofscreen,
                    //                 height: heightofscreen * .07,
                    //                 decoration: BoxDecoration(
                    //                   image: const DecorationImage(
                    //                       image: AssetImage(
                    //                         "assets/images/bg11.jpg",
                    //                       ),
                    //                       fit: BoxFit.fitWidth),
                    //                   borderRadius: BorderRadius.circular(20),
                    //                 ),
                    //                 child: Padding(
                    //                   padding:
                    //                       const EdgeInsets.only(left: 20.0),
                    //                   child: Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     mainAxisAlignment:
                    //                         MainAxisAlignment.center,
                    //                     children: [
                    //                       Text(
                    //                         dptYrsnap.id,
                    //                         style: TextStyle(
                    //                           fontSize: 15.0,
                    //                           color: Colors.black,
                    //                           fontWeight: FontWeight.bold,
                    //                         ),
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ),
                    //             );
                    //           },
                    //           separatorBuilder: (context, index) {
                    //             return SizedBox(
                    //               height: heightofscreen * .05,
                    //             );
                    //           },
                    //           itemCount: snapshot.data!.docs.length);
                    //     }
                    //     return Container();
                    //   },
                    // ),
                  ),
                ),
              ],
            ),
          )
          //   },
          // )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return ScreenAddButtonAttendence(
                    yr: widget.yr, dept: widget.dept);
              },
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
