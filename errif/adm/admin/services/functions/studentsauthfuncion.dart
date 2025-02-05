import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServicesOfStudent {
  final CollectionReference usersss =
      FirebaseFirestore.instance.collection("Student");

  static signupUser(
      String email,
      String password,
      String name,
      String regId,
      String selectedDepartmentofStudent,
      String selectedYearofStudent,
      String phno,
      BuildContext context) async {
    try {
      // Check if regId already exists
      bool isRegIdExists = await checkRegIdExists(
          selectedDepartmentofStudent, selectedYearofStudent, regId);
      if (isRegIdExists) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Registration ID already exists.')));
        return; // Exit the method
      }

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      String userId = userCredential.user!.uid;

      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      DocumentReference studentRef = FirebaseFirestore.instance
          .collection('Student')
          .doc(userId);

      // Create departments collection (if not already created)
      CollectionReference deptRef = FirebaseFirestore.instance
          .collection('Student')
          .doc(selectedDepartmentofStudent)
          .collection(selectedYearofStudent);
      DocumentReference studentDetailsRef = deptRef.doc(userId);
 CollectionReference deptRef2 = FirebaseFirestore.instance
          .collection('StudentList');
          DocumentReference studentDetailsRef2 = deptRef2.doc(userId);
            await studentDetailsRef2.set({
        'name': name,
        'department': selectedDepartmentofStudent,
        'year': selectedYearofStudent,
        'userId': userId,
        
      });
      await studentDetailsRef.set({
        'name': name,
        'regid': regId,
        'email': email,
        'department': selectedDepartmentofStudent,
        'year': selectedYearofStudent,
        'attendance': false,
        'userId': userId,
        'phn' : phno,
      });
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

  static Future<bool> checkRegIdExists(
      String selectedDepartmentofStudent,
      String selectedYearofStudent,
      String regId) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Student')
        .doc(selectedDepartmentofStudent)
        .collection(selectedYearofStudent)
        .get();

    for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
      if (docSnapshot['regid'] == regId) {
        return true; // RegId already exists
      }
    }

    return false; // RegId doesn't exist
  }
}


//old

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class AuthServicesOfStudent {
//   final CollectionReference usersss =
//       FirebaseFirestore.instance.collection("Student");

//   static signupUser(
//       String email,
//       String password,
//       String name,
//       String regId,
//       String selectedDepartmentofStudent,
//       String selectedYearofStudent,
//       BuildContext context) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//  String userId = userCredential.user!.uid; 

//       await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
//       await FirebaseAuth.instance.currentUser!.updateEmail(email);
//       DocumentReference studentRef = FirebaseFirestore.instance
//           .collection('Student')
//           .doc(userId);

//       // Create departments collection (if not already created)
//       CollectionReference deptRef = FirebaseFirestore.instance
//           .collection('Student')
//           .doc(selectedDepartmentofStudent)
//           .collection(selectedYearofStudent);
//       DocumentReference studentDetailsRef =
//           deptRef.doc(userCredential.user!.uid);

//       await studentDetailsRef.set({
//         'name': name,
//         'regid':regId,
//         'email': email,
//         'department': selectedDepartmentofStudent,
//         'year': selectedYearofStudent,
//         'attendance': false,
//         'userId':userId,
//       });
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Registration Successful')));
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Password Provided is too weak')));
//       } else if (e.code == 'email-already-in-use') {
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Email Provided already Exists')));
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(e.toString())));
//     }
//     // Navigator.of(context).pop();
//   }
// }
