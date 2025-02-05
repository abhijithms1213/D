import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mentor_app/presentation/attendencesee/atndnceseefromperiodpage.dart';

class StylishList extends StatelessWidget {
  const StylishList({
    Key? key,
    required this.yrs,
    required this.dept,
    required this.userId,
    required this.fullDate,
  }) : super(key: key);

  final String yrs;
  final String dept;
  final String userId;
  final String fullDate;

  @override
  Widget build(BuildContext context) {
    final CollectionReference periodNamesList = FirebaseFirestore.instance
        .collection('professor')
        .doc(userId)
        .collection('department')
        .doc(dept)
        .collection(dept)
        .doc(yrs)
        .collection('date')
        .doc(fullDate)
        .collection('periods');

    return LayoutBuilder(
      builder: (context, constraints) {
        final double padding = constraints.maxWidth * 0.05;
        final double titleFontSize = constraints.maxWidth * 0.04;
        final double subtitleFontSize = constraints.maxWidth * 0.035;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Period List'),
            backgroundColor: Colors.black,
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.grey[600]!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: StreamBuilder<QuerySnapshot>(
              stream: periodNamesList.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: EdgeInsets.all(padding),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot periodNamesListsnap =
                          snapshot.data!.docs[index];
                      final String docId = periodNamesListsnap.id;
                      return Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(16, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.01),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(bottom: padding),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(padding),
                          title: Text(
                            '',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            docId,
                            style: TextStyle(
                              color: Color.fromARGB(108, 231, 228, 228),
                              fontSize: subtitleFontSize,
                            ),
                          ),
                          trailing:const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black38,
                          ),
                          onTap: () {
                            print(index);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ScreenAttendenceDetails(
                                      yrs: yrs,
                                      dept: dept,
                                      userId: userId,
                                      fullDate: fullDate,
                                      periodText: docId);
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                }
                return Center(
                  child: Container(
                    child: Text(
                      'Loading...',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
