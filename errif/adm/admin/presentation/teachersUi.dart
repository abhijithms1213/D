import 'package:admin_portal01/presentation/constants/const.dart';
import 'package:admin_portal01/presentation/editFromTeacher/editteachers.dart';
import 'package:admin_portal01/presentation/studentUI/studentui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'editFromStudent/editstudent.dart';

class ScreenTeacher extends StatelessWidget {
  const ScreenTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionReference prof =
        FirebaseFirestore.instance.collection('professor');
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text("Admin Panel"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            khbox20,
            const Text(
              "Professors List",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            khbox10,
            StreamBuilder(
                stream: prof.snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          final DocumentSnapshot dptsnap =
                              snapshot.data.docs[index];
                          String deptName = dptsnap['name'];
                              //    int deptclasses = dptsnap['TotalClasses'];
                                          String deptsubject = dptsnap['subject'];
                          return Padding(
                            padding:
                                EdgeInsets.only(left: 10, top: 40, right: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(10)),
                              height: size.height * .13,
                              child: Column(
                                children: [
                                  khbox10,
                                  Text(deptName),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                     // Text("No: of classes: $deptclasses",style: TextStyle(color: Color.fromARGB(255, 24, 77, 51)),),
                                      Text("subject: $deptsubject")
                                    ],),
                                  ),
                                      DeleteButton(
                                    onPressed: () {
                                      // Delete profile logic
                                      deleteProfile(dptsnap.id);
                                      // deleteProfile(dptsnap
                                      //     .id); // Assuming dptsnap.id is the document ID
                                    },
                                  ),

                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            height: 5,
                          );
                        },
                        itemCount: snapshot.data!.docs.length,
                      ),
                    );
                  }
                  return const SizedBox(
                    height: 10,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 119, 119, 119),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return SCreenEditTeachersByButton();
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
  void deleteProfile(String documentId) {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  // Delete the profile document
  firestore
      .collection('professor')
      .doc(documentId)
      .delete()
      .then((_) {
    // Profile document successfully deleted

    // Delete the user in Firebase Authentication
    auth.currentUser!.delete().then((_) {
      // User deleted successfully
      // You can perform any additional actions here
    }).catchError((error) {
      // An error occurred while deleting the user
      // Handle the error appropriately
    });
  }).catchError((error) {
    // An error occurred while deleting the profile document
    // Handle the error appropriately
  });
}
}
