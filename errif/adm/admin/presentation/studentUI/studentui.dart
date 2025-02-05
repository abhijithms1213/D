import 'package:admin_portal01/presentation/editFromStudent/editstudent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constants/const.dart';

class ScreenStudent extends StatelessWidget {
  const ScreenStudent({super.key});
  @override
  Widget build(BuildContext context) {
    final CollectionReference stdnt =
        FirebaseFirestore.instance.collection('StudentList');
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text("Admin Panel"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            khbox20,
            const Text(
              "Students List",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            khbox10,
            StreamBuilder(
                stream: stdnt.snapshots(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          final DocumentSnapshot dptsnap =
                              snapshot.data.docs[index];
                          String stdname = dptsnap['name'];
                          String stddept = dptsnap['department'];
                          String stdyr = dptsnap['year'];
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
                                  Text(
                                    stdname,
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 181, 8, 8)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "department: $stddept",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 24, 77, 51)),
                                        ),
                                        Text("year: $stdyr")
                                      ],
                                    ),
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
        backgroundColor: const Color.fromARGB(255, 119, 119, 119),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return SCreenEditStudentByButton();
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

void deleteProfile2(String documentId) {
  FirebaseAuth.instance.currentUser!.delete().then((_) {
    // User deleted successfully
    // Now delete the profile document
    FirebaseFirestore.instance
        .collection('StudentList')
        .doc(documentId)
        .delete()
        .then((_) {
      // Profile successfully deleted
      // You can perform any additional actions here
    }).catchError((error) {
      // An error occurred while deleting the profile
      // Handle the error appropriately
    });
  }).catchError((error) {
    // An error occurred while deleting the user
    // Handle the error appropriately
  });
}

 void deleteProfile(String documentId) {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  // Delete the profile document
  firestore
      .collection('StudentList')
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

class DeleteButton extends StatelessWidget {
  final VoidCallback onPressed;

  const DeleteButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.delete),
      onPressed: onPressed,
    );
  }
}
