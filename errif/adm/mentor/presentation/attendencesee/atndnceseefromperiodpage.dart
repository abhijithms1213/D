import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ScreenAttendenceDetails extends StatelessWidget {
  const ScreenAttendenceDetails({
    Key? key,
    required this.yrs,
    required this.dept,
    required this.userId,
    required this.fullDate,
    required this.periodText,
  }) : super(key: key);

  final String yrs;
  final String dept;
  final String userId;
  final String fullDate;
  final String periodText;

  @override
  Widget build(BuildContext context) {
    // QController _qcontroller = Get.find();
    final widthofscreen = MediaQuery.of(context).size.width;
    final heightofscreen = MediaQuery.of(context).size.height;
    final CollectionReference periodNamesList = FirebaseFirestore.instance
        .collection('professor')
        .doc(userId)
        .collection('department')
        .doc(dept)
        .collection(dept)
        .doc(yrs)
        .collection('date')
        .doc(fullDate)
        .collection('periods');
    final String periodText2;
    meth(periodNamesList);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Details",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Date:   : ",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    fullDate,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: heightofscreen * .02,
              ),
              Row(
                children: [
                  Text(
                    periodText,
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: heightofscreen * .02,
              ),
              const Text(
                "List of Students",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: heightofscreen * .04,
              ),
              Expanded(
                child: FutureBuilder(
                  future: meth(periodNamesList),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }
                    Map<String, dynamic> periodData =
                        snapshot.data! as Map<String, dynamic>;

                    List<String> fieldNames = periodData.keys.toList();
                     fieldNames.sort((a, b) {
        bool isPresentA = periodData[a];
        bool isPresentB = periodData[b];
        if (isPresentA && !isPresentB) {
          return -1; // a is Present, b is Absent, so a should come before b
        } else if (!isPresentA && isPresentB) {
          return 1; // b is Present, a is Absent, so b should come before a
        }
        return 0; // Both are either Present or Absent, maintain their original order
      });
                    return ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                       String fieldName = fieldNames[index];
          bool fieldValue = periodData[fieldName];

          String attendanceStatus = getAttendanceStatus(fieldValue);
                        // String fieldName2 = fieldNames[index];
                        // bool fieldValue2 = periodData[fieldName];
                        Color statusColor =
                            fieldValue ? Colors.black : Colors.red;
                        return Container(
                          width: widthofscreen,
                          height: heightofscreen * .07,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 242, 242, 242),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      fieldName,
                                      style: const TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      "${attendanceStatus}",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: statusColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: heightofscreen * .05,
                        );
                      },
                      itemCount: fieldNames.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  meth(periodNamesList) async {
    final DocumentSnapshot periodSnapshot =
        await periodNamesList.doc(periodText).get();

    if (periodSnapshot.exists) {
      // Document exists, you can access its data
      final Map<String, dynamic>? periodData =
          periodSnapshot.data() as Map<String, dynamic>?;
      if (periodData != null) {
        // Display the data or perform any other operations
        print(periodData);
        return periodData;
      } else {
        print('Document data is null.');
      }
    } else {
      // Document doesn't exist
      print('Document does not exist.');
    }
  }

  String getAttendanceStatus(bool value) {
    return value ? 'Present' : 'Absent';
  }
}
