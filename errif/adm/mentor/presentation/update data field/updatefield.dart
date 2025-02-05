
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class UserDataUpdateScreen extends StatefulWidget {
//   @override
//   _UserDataUpdateScreenState createState() => _UserDataUpdateScreenState();
// }

// class _UserDataUpdateScreenState extends State<UserDataUpdateScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   late String _uid;
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   void updateUser() async {
//      User? user = _auth.currentUser;
//     _uid = user!.uid;

//     await _firestore.collection('professor').doc(user.uid).update({
//       'name': _nameController.text,
//       'email': _emailController.text,
//       'password': _passwordController.text,
//     });

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('User data updated')),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Data Update'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextFormField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             TextFormField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 updateUser();
//               },
//               child: Text('Update'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }