import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_sms/flutter_sms.dart';

import '../../services/functions/authserviceofprofessor.dart';

class ScreenAddButtonAttendence extends StatefulWidget {
  const ScreenAddButtonAttendence(
      {super.key, required this.yr, required this.dept});

  final String yr;
  final String dept;
  @override
  State<ScreenAddButtonAttendence> createState() =>
      _ScreenAddButtonAttendenceState();
}

class _ScreenAddButtonAttendenceState extends State<ScreenAddButtonAttendence> {
  bool? isChanged = false;
  final periodNumber = ['1', '2', '3', '4', '5', '6', 'Ad: hr'];
  String? selectedPeriodNumber = '1';
  DateTime _dateTime = DateTime.now();
  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    ).then((value) {
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final CollectionReference dptdetails = FirebaseFirestore.instance
        .collection('Student')
        .doc(widget.dept)
        .collection(widget.yr);
    final widthofscreen = MediaQuery.of(context).size.width;
    final heightofscreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 240, 240),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: widthofscreen,
              height: heightofscreen * .07,
              color: const Color.fromARGB(255, 241, 240, 240),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Row(
                  children: [
                    const Text(
                      "Attendence",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                         resetBoolValues();
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  width: widthofscreen,
                  height: heightofscreen * .1,
                  color: Colors.black,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.95),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 20,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        width: widthofscreen,
                        height: heightofscreen * .15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: widthofscreen * .15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: heightofscreen * .05,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        _showDatePicker();
                                      },
                                      child: Container(
                                        width: widthofscreen * .22,
                                        height: widthofscreen * .05,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: const Center(
                                          child: Text(
                                            "Select The Date",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      _dateTime.day.toString(),
                                    ),
                                    Text("/"),
                                    Text(
                                      _dateTime.month.toString(),
                                    ),
                                    Text("/"),
                                    Text(
                                      _dateTime.year.toString(),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: heightofscreen * .004,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "   Period no:",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: widthofscreen * .08,
                                    ),
                                    SizedBox(
                                      width: widthofscreen * .23,
                                      height: widthofscreen * .1,
                                      child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.grey[200],
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 10),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                        value: selectedPeriodNumber ?? '1',
                                        elevation: 4,
                                        items: periodNumber
                                            .map((e) => DropdownMenuItem(
                                                  value: e,
                                                  child: Text(e),
                                                ))
                                            .toList(),
                                        onChanged: (value) {
                                          selectedPeriodNumber = value;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            StreamBuilder(
              stream: dptdetails.orderBy('regid').snapshots(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  List<DocumentSnapshot> sortedDocs = snapshot.data.docs;
                  sortedDocs.sort((a, b) {
                    String regidA = a['regid'];
                    String regidB = b['regid'];
                    String lastThreeDigitsA =
                        regidA.substring(regidA.length - 3);
                    String lastThreeDigitsB =
                        regidB.substring(regidB.length - 3);
                    return lastThreeDigitsA.compareTo(lastThreeDigitsB);
                  });
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final DocumentSnapshot stdNamesdetailsSnap =
                              sortedDocs[index];
                          String detailedstdName = stdNamesdetailsSnap['name'];
                          bool? isChanging = stdNamesdetailsSnap['attendance'];
                          return Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                            child: Container(
                              height: heightofscreen * .08,
                              //color: Colors.black26,
                              child: Row(
                                children: [
                                  Text(detailedstdName),
                                  const Spacer(),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.black,
                                    value: isChanging,
                                    onChanged: (val) {
                                      setState(() {
                                        print(isChanging);
                                        isChanging = val;
                                      });
                                      stdNamesdetailsSnap.reference
                                          .update({'attendance': isChanging});
                                    },
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 50.0, right: 50, top: 10),
                            child: Container(
                              width: 30.0,
                              height: 1,
                              color: Colors.black.withOpacity(.05),
                            ),
                          );
                        },
                        itemCount: snapshot.data!.docs.length),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          wait();

          // resetBoolValues();
          // Navigator.of(context).pop();
        },
        child: Icon(Icons.done),
      ),
    );
  }

  resetBoolValues() async {
    final CollectionReference dptdetails = FirebaseFirestore.instance
        .collection('Student')
        .doc(widget.dept)
        .collection(widget.yr);

    dptdetails.get().then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        doc.reference.update({'attendance': false});
      }
    });
  }

  Future<void> wait() async {
    AuthServicesOfProfessor().getUid(
        widget.dept,
        widget.yr,
        '${_dateTime.day} ${_dateTime.month} ${_dateTime.year}',
        'period $selectedPeriodNumber',
        _dateTime,
        context);
  }

  void _sendSMS(String message, List<String> recipents) async {
    String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }
}
