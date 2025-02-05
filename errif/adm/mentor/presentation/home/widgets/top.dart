import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentor_app/presentation/update%20data%20field/updatefield.dart';

class WidgetTopOfHome extends StatefulWidget {
  const WidgetTopOfHome({
    super.key,
    required this.widthofscreen,
    required this.heightofscreen,
  });

  final double widthofscreen;
  final double heightofscreen;

  @override
  State<WidgetTopOfHome> createState() => _WidgetTopOfHomeState();
}

class _WidgetTopOfHomeState extends State<WidgetTopOfHome> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _uid;
  late String _name;
  String? Us;
  // String? myEmail;
  getData()async {
    User? user = _auth.currentUser;
    _uid = user!.uid;
    Us=user.displayName;
    print(user.uid);
    //  final DocumentSnapshot userDoc = await FirebaseFirestore.instance
    //     .collection('professor')
    //     .doc(_uid)
    //     .get();
    //     _name=userDoc.get('name');
    //     print(_name);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // otherGet();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.widthofscreen,
      height: widget.heightofscreen * .35,
      color: Colors.black,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Color.fromARGB(255, 236, 236, 236),
                    child: IconButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                      },
                      icon: Icon(Icons.logout),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: widget.heightofscreen * .02,
              ),
              Row(
                children: [
                  const Text(
                    "Hello ",
                    style: TextStyle(color: Colors.white, fontSize: 33),
                  ),
                  Text(
                        Us.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 33),
                      )
                ],
              ),
              SizedBox(
                height: widget.heightofscreen * .02,
              ),
              const Text(
                "welcome to our digital attendence app",
                style: TextStyle(
                  color: Colors.white30,
                ),
              ),
              SizedBox(
                height: widget.heightofscreen * .02,
              ),
              Container(
                width: widget.widthofscreen,
                height: widget.heightofscreen * .09,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: widget.widthofscreen * .03,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(builder:(context) {
                        //   return UserDataUpdateScreen();
                        // },));
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundColor: Color.fromARGB(255, 236, 236, 236),
                        child: Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widget.widthofscreen * .03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: widget.heightofscreen * .02,
                        ),
                        const Text(
                          "Edit your profile",
                          style: TextStyle(
                            color: Colors.white30,
                          ),
                        ),
                        SizedBox(
                          height: widget.heightofscreen * .006,
                        ),
                        const Text(
                          "enteR!",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
