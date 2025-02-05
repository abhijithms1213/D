import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'authFunctions.dart';

class FirestoreServices {
  final CollectionReference usersss=FirebaseFirestore.instance.collection("users");
  static saveUser(String name, email, uid) async {

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set({'email': email, 'name': name});
        
  }
}
