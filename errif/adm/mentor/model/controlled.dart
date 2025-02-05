// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:mentor_app/model/model.dart';

// class QController extends GetxController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   String? id;
//   late String _uid;
//   final allpapers = <MyModel>{}.obs;
//     final yrs = <MyModel>{}.obs;
//   @override
//   void onReady() {
//     getData();
//     getAllPapers();
//     super.onReady();
//   }

//   getAllPapers() async {
//     CollectionReference usersCollection =
//         FirebaseFirestore.instance.collection('professor');
//     final QuerySnapshot<Map<String, dynamic>> departmentQuery =
//         await usersCollection.doc(_uid).collection('department').get();
//     final departments = departmentQuery.docs.map((e) => MyModel.fromSnapshot(e));
  
//     allpapers.assignAll(departments);
  
//     yrs.assignAll(departments);
//   }

//   getData() async {
//     User? user = _auth.currentUser;
//     _uid = user!.uid;
//   }

//   // Work(QueryDocumentSnapshot<Map<String, dynamic>> snapshot) {
//   //   id = snapshot.id;
//   //   String dept = snapshot['name'];
//   //   var dptname = [];
//   // }
// }
