import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mentor_app/presentation/home/widgets/bottom2.dart';
import 'package:mentor_app/presentation/home/widgets/top.dart';
import 'package:mentor_app/presentation/yearpage/widgets/bottomofyear.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _uid;
  late String _name;
  String? Us;
  getData() async {
    User? user = _auth.currentUser;
    _uid = user!.uid;
    Us = user.displayName;
    print(user.uid);
  }

  @override
  Widget build(BuildContext context) {
    final widthofscreen = MediaQuery.of(context).size.width;
    final heightofscreen = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetTopOfHome(
              widthofscreen: widthofscreen, heightofscreen: heightofscreen),
       WidgetBottomOfHomeTwo()
        ],
      ),
    );
  }
}
