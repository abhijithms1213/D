import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mentor_app/presentation/attendencesee/atndnceseefromperiodpage.dart';
import 'package:mentor_app/presentation/periods/period.dart';

class WidgetDownOfDate extends StatelessWidget {
  WidgetDownOfDate({
    super.key,
    required this.heightofscreen,
    required this.widthofscreen,
    required this.yrs,
    required this.dept,
    required this.userId,
  });

  final double heightofscreen;
  final double widthofscreen;
  final String yrs;
  final String dept;
  final String userId;

  @override
  Widget build(BuildContext context) {
    final CollectionReference dptYears = FirebaseFirestore.instance
        .collection('professor')
        .doc(userId)
        .collection('department')
        .doc(dept)
        .collection(dept)
        .doc(yrs)
        .collection('date');
        
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              //print(fullyDate2);
            },
            child: const Text(
              'select',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: SizedBox(
              height: heightofscreen * .5,
              child: StreamBuilder(
                
                stream: dptYears.orderBy('monthwithday').snapshots(),


                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot dptYearssnap =
                              snapshot.data.docs[index];
                              
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return StylishList(
                                        yrs: yrs,
                                        dept: dept,
                                        userId: userId,
                                        fullDate:
                                            dptYearssnap['fully'] as String);
                                  },
                                ),
                              );
                            },
                            child: Container(
                              width: widthofscreen,
                              height: heightofscreen * .07,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage(
                                      "assets/images/bg11.jpg",
                                    ),
                                    fit: BoxFit.fitWidth),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${dptYearssnap['monthName']}   ",
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black38,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${dptYearssnap['day']}",
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "${dptYearssnap['year']}",
                                      style: const TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.black26,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: heightofscreen * .05,
                          );
                        },
                        itemCount: snapshot.data!.docs.length);
                  }
                  return Container();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
// ListView.separated(
//                   scrollDirection: Axis.vertical,
//                   itemBuilder: (context, index) {
//                     return InkWell(
//                       onTap: () {
//                         Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) {
//                               return ScreenAttendenceDetails();
//                             },
//                           ),
//                         );
//                       },
//                       child: Container(
//                         width: widthofscreen,
//                         height: heightofscreen * .07,
//                         decoration: BoxDecoration(
//                           image: const DecorationImage(
//                               image: AssetImage(
//                                 "assets/images/bg11.jpg",
//                               ),
//                               fit: BoxFit.fitWidth),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 20.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: const [
//                               Text(
//                                 "period no 1",
//                                 style: TextStyle(
//                                   fontSize: 15.0,
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                   separatorBuilder: (context, index) {
//                     return SizedBox(
//                       height: heightofscreen * .05,
//                     );
//                   },
//                   itemCount: 4),