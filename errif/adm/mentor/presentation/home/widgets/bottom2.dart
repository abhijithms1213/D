import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mentor_app/presentation/attendencesee/atndnceseefromperiodpage.dart';
import 'package:mentor_app/presentation/yearpage/yearpage.dart';
import '../../../model/controlled.dart';
import '../../../model/model.dart';

class WidgetBottomOfHomeTwo extends StatefulWidget {
  const WidgetBottomOfHomeTwo({
    super.key,
  });

  @override
  State<WidgetBottomOfHomeTwo> createState() => _WidgetBottomOfHomeTwoState();
}

class _WidgetBottomOfHomeTwoState extends State<WidgetBottomOfHomeTwo> {
  late String uid;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      uid = user.uid;
      print('User UID: $uid');
    } else {
      print('User is not logged in.');
    }
  }

  @override
  Widget build(BuildContext context) {
    //  final widthofscreen = MediaQuery.of(context).size.width;
    final CollectionReference dpt = FirebaseFirestore.instance
        .collection('professor')
        .doc(uid)
        .collection('department');
    final heightofscreen = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: heightofscreen * .02,
          ),
          const Text(
            "Departments",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: heightofscreen * .002,
          ),
          StreamBuilder(
            stream: dpt.snapshots(),
            builder: (context,AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: heightofscreen * .5,
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    children: List.generate(
                      snapshot.data!.docs.length,
                      (index) {
                        final DocumentSnapshot dptsnap=snapshot.data.docs[index];
                        String deptName=dptsnap['dept'];
                        return Container(
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black.withOpacity(.05),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return ScreenYear(
                                      uid: uid,
                                      dptname: deptName,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: heightofscreen * .08,
                                  ),
                                  Text(
                                  deptName,
                                    style: const TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: heightofscreen * .008,
                                  ),
                                  Text(
                                    'department ${index + 1}',
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black38,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
