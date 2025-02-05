import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentor_app/presentation/datewise/dates.dart';
import 'package:mentor_app/presentation/datewise2all/dtes.dart';

class WidgetBottomOfYearPage extends StatelessWidget {
  const WidgetBottomOfYearPage({
    super.key,
    required this.heightofscreen,
    required this.uid,
    required this.deptName,
  });

  final double heightofscreen;
  final String uid;
  final String deptName;

  @override
  Widget build(BuildContext context) {
    final CollectionReference dptYears = FirebaseFirestore.instance
        .collection('professor')
        .doc(uid)
        .collection('department')
        .doc(deptName)
        .collection(deptName);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: heightofscreen * .02,
          ),
          const Text(
            "sem/year",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: heightofscreen * .002,
          ),
          StreamBuilder<QuerySnapshot>(
            stream: dptYears.snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: heightofscreen * .5,
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    children: List.generate(snapshot.data!.docs.length, (index) {
                       final DocumentSnapshot dptYrsnap=snapshot.data.docs[index];
                        String deptYrName=dptYrsnap['yrs'];
                      return Container(
                        decoration: BoxDecoration(
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
                                  return 
                                  //ScreenDateAllSecond(yr: deptYrName, dept: deptName);
                                  ScreenDate(yr: deptYrName,dept:deptName,);
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
                                  dptYrsnap['yrs'],
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
                                  'from $deptName',
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
                    }),
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
