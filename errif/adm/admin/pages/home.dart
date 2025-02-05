import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // If the user is not logged in, display a message or redirect to login page
      return Center(
        child: Text('Please log in to view this page'),
      );
    } else {
      return Scaffold(
         appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: Icon(Icons.leave_bags_at_home))
        ],
        title: Text('Home'),
      ),
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              // If the document hasn't loaded yet, display a progress indicator
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.data == null) {
              // If the document doesn't exist, display an error message
              return Center(
                child: Text('Document does not exist'),
              );
            } else {
              // Otherwise, display the user's data
              final Map<String, dynamic> userData =
                  snapshot.data!.data() as Map<String, dynamic>? ?? {};

              final String number = userData['name'] ?? '';
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Number: $number'),
                  ],
                ),
              );
            }
          },
        ),
      );
    }
  }
}
