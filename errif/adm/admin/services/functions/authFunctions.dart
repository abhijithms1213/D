import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  final CollectionReference usersss =
      FirebaseFirestore.instance.collection("professor");

  static signupUser(
      String email,
      String password,
      String name,
      String subname,
      String description,
      List<String> selectedDepartmentofProfessor,
      List<String> selectedYearofProfessor,
      BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
 String userId = userCredential.user!.uid; 
      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);

      DocumentReference docRef = FirebaseFirestore.instance
          .collection('professor')
          .doc(userId);

      // Create collections for each selected department
      for (int i = 0; i < selectedDepartmentofProfessor.length; i++) {
        CollectionReference deptRef = docRef.collection('department');
        CollectionReference branchRef = deptRef
            .doc(selectedDepartmentofProfessor[i])
            .collection(selectedDepartmentofProfessor[i]);
        await deptRef.doc(selectedDepartmentofProfessor[i]).set({
          'dept': selectedDepartmentofProfessor[i],
        });
        List<String> yearings = selectedYearofProfessor[i].split('&');
        for (String year in yearings) {
          // CollectionReference yearRef =
          //     branchRef.doc(year.toString()).collection(year);
          // await yearRef.add({'number': '1'});
          await branchRef.doc(year.toString()).set({
            'yrs': year.toString(),
          });
        }
      }
      await docRef.set({
        'email': email,
        'name': name,
        'subject': subname,
        'userId':userId,
      });

      // list of teachers by dpt
      DocumentReference ProfessorRef = FirebaseFirestore.instance
          .collection('Teachers List')
          .doc(userCredential.user!.uid);

      // Create departments collection (if not already created)
      for (int i = 0; i < selectedDepartmentofProfessor.length; i++) {
        List<String> yearings = selectedYearofProfessor[i].split('&');
        for (String year in yearings) {
          CollectionReference deptRef = FirebaseFirestore.instance
              .collection('Teachers List')
              .doc(selectedDepartmentofProfessor[i])
              .collection(year);
          DocumentReference ProfessorDetailsRef =
              deptRef.doc(userCredential.user!.uid);
          await ProfessorDetailsRef.set({
            'name': name,
            'subject': subname,
            'description': description,
          });
        }
      }
      //  CollectionReference deptRef2 = FirebaseFirestore.instance
      //     .collection('ListofTeachers');
      //     DocumentReference studentDetailsRef2 = deptRef2.doc(userId);
      //       await studentDetailsRef2.set({
      //   'name': name,
      //   'subject': subname,
      //   'year': selectedYearofProfessor,
      //   'dept': selectedDepartmentofProfessor,
      // });
      //
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registration Successful')));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Password Provided is too weak')));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Email Provided already Exists')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    // Navigator.of(context).pop();
  }
}
