import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentor_app/presentation/addbuttonattendencepage/addbuttonattendence.dart';
import 'package:mentor_app/presentation/datewise/widgets/bottumofdate.dart';
import 'package:mentor_app/presentation/datewise/widgets/topofdate.dart';

ValueNotifier<int> indexchange = ValueNotifier(0);

class ScreenDate extends StatelessWidget {
  ScreenDate({super.key, required this.yr, required this.dept});

  final String yr;
  final String dept;

  String userId = '';
  @override
  Widget build(BuildContext context) {
    final widthofscreen = MediaQuery.of(context).size.width;
    final heightofscreen = MediaQuery.of(context).size.height;
    User? user = FirebaseAuth.instance.currentUser;
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
          WidgetTopOfDate(
              heightofscreen: heightofscreen,
              widthofscreen: widthofscreen,
              yrs: yr,
              dept: dept,
              userId: userId),
          WidgetDownOfDate(
            heightofscreen: heightofscreen,
            widthofscreen: widthofscreen,
            yrs: yr,
            dept: dept,
            userId: userId,
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
                return ScreenAddButtonAttendence(yr: yr, dept: dept);
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
