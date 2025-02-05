import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_sms/flutter_sms.dart';
List<String> recipents = [];

class AuthServicesOfProfessor {
  // AuthServicesOfProfessor(
  //     { required this.meth});
  final CollectionReference usersss =
      FirebaseFirestore.instance.collection("professor");
  int presentCount = 0;
  int status =0;
  String? uid;
  int cumulativeTotalClasses = 0;
  List<dynamic> attendanceList = [];

  Future<void> getUid(String dept, String yrs, String date, String period,
      DateTime _dateTime, BuildContext context) async {
    try {
      recipents=[];
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user = auth.currentUser;

      if (user != null) {
        uid = user.uid;
      } else {
        print('failed');
      }
      CollectionReference deptRef = FirebaseFirestore.instance
          .collection('professor')
          .doc(uid)
          .collection('department')
          .doc(dept)
          .collection(dept)
          .doc(yrs)
          .collection("date")
          .doc(date)
          .collection('periods');
      CollectionReference addDateForMention = FirebaseFirestore.instance
          .collection('professor')
          .doc(uid)
          .collection('department')
          .doc(dept)
          .collection(dept)
          .doc(yrs)
          .collection("date");
      DocumentReference studentDetailsRef = deptRef.doc(period);
      CollectionReference dptdetails = FirebaseFirestore.instance
          .collection('Student')
          .doc(dept)
          .collection(yrs);
      DocumentSnapshot existingDoc = await studentDetailsRef.get();
      CollectionReference forsubject =
          FirebaseFirestore.instance.collection('professor');
      DocumentSnapshot forsubjectDoc = await forsubject.doc(uid).get();
      String subjectName = forsubjectDoc['subject'];
      if (existingDoc.exists) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text("This period has been already taken,u can't change/add")));
        return;
      }

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 16.0),
                  Text("Adding..."),
                ],
              ),
            ),
          );
        },
      );
      QuerySnapshot snapshot = await dptdetails.get();
      List<QueryDocumentSnapshot> documents = snapshot.docs;
      Map<String, dynamic> studentData = {};
      String _monthName = DateFormat('MMMM').format(_dateTime);
      await addDateForMention.doc(date).set({
        'day': _dateTime.day,
        'month': _dateTime.month,
        'year': _dateTime.year,
        'monthName': _monthName,
        'monthwithday': "${_dateTime.month}${_dateTime.day}",
        'fully': date,
      });

      for (QueryDocumentSnapshot doc in documents) {
        String name = doc['name'];
        bool attendance = doc['attendance'];
        studentData[name] = attendance;
      }

      await studentDetailsRef.set(studentData);
      DocumentReference teacherDocRef =
          FirebaseFirestore.instance.collection('professor').doc(uid);

      DocumentSnapshot teacherDocSnapshot = await teacherDocRef.get();
      if (teacherDocSnapshot.exists) {
        Map<String, dynamic>? data =
            teacherDocSnapshot.data() as Map<String, dynamic>?;
        int totalClasses = data?['TotalClasses'] ?? 0;
        totalClasses++;
        await teacherDocRef.update({'TotalClasses': totalClasses});
        // Update TotalClasses in every document within dptdetails collection
        QuerySnapshot dptdetailsSnapshot = await dptdetails.get();
        List<QueryDocumentSnapshot> dptdetailsDocuments =
            dptdetailsSnapshot.docs;
        //  int presentCount = 0;
        for (QueryDocumentSnapshot doc in dptdetailsDocuments) {
          String docId = doc.id;
          bool attendance = doc['attendance'];
          CollectionReference deptRef = FirebaseFirestore.instance
              .collection('Student')
              .doc(dept)
              .collection(yrs)
              .doc(docId)
              .collection('ListOfSub');
          DocumentReference professorDetailsRef = deptRef.doc(subjectName);
          CollectionReference absentListingRef =
              professorDetailsRef.collection('absentListing');
          CollectionReference graphRef =
              professorDetailsRef.collection('graph');
              DateTime currentTime = DateTime.now();
              String documentId = '${currentTime.day} ${currentTime.month} ${currentTime.year} ${currentTime.hour} ${currentTime.minute} ${currentTime.second}';

            //  String documentId2 = DateTime.now().toUtc().toIso8601String();
          // int count = 0;

          if (attendance == true) {
            DocumentSnapshot professorDetailsSnapshot =
                await professorDetailsRef.get();
            int previousPresentCount = professorDetailsSnapshot.exists
                ? professorDetailsSnapshot['present']
                : 0;
            presentCount = previousPresentCount + 1;
            attendanceList.add(1);
            String value = "1";
            // DocumentSnapshot professorDetailsSnapshot =
            //     await professorDetailsRef.get();
            Map<String, dynamic>? data =
                professorDetailsSnapshot.data() as Map<String, dynamic>?;
            if (data != null && data.containsKey('listed')) {
              await professorDetailsRef.update({
                'listed': value,
              });
            } else {
              await professorDetailsRef.set({
                'listed': value,
              });
            }
            await professorDetailsRef.set({'attendanceList': attendanceList});

            //
            DocumentReference graphDocRef = graphRef.doc(documentId);
             status = 1;
       //     DocumentReference graphDocRef = graphRef.doc('$date $period');

            // prev
            // await graphDocRef
            //     .set({'date': date, 'period': period, 'status': 100});
          } else {
             String phoneNumber = doc['phn'];
    recipents.add(phoneNumber);
            DocumentSnapshot professorDetailsSnapshot =
                await professorDetailsRef.get();
            int previousPresentCount = professorDetailsSnapshot.exists
                ? professorDetailsSnapshot['present']
                : 0;
            presentCount = previousPresentCount;
            // attendanceList.add(date);
            // await professorDetailsRef.set({'attendanceList': attendanceList});
            DocumentReference absentDocRef = absentListingRef.doc(date);
            //counting
            DocumentReference counting =
                deptRef.doc(subjectName).collection('absentListing').doc(date);
            DocumentSnapshot documentSnapshot = await counting.get();
            if (documentSnapshot.exists) {
              Map<String, dynamic>? data =
                  documentSnapshot.data() as Map<String, dynamic>?;

              if (data != null) {
                int count = data.keys.length;

                await counting.update({'field_count': count});
              } else {
                // Handle the case when the data is null or not in the expected format
                print(
                    'Error: Document data is null or not in the expected format');
              }
            } else {
              // Handle the case
              // when the document doesn't exist
              await counting.set({'field_count': 1});
              print('Error: Document does not exist');
            }
            await absentDocRef.set({period: 'absent'}, SetOptions(merge: true));
                        DocumentReference graphDocRef = graphRef.doc(documentId);
             status = -1;
          }
          
QuerySnapshot querySnapshot = await graphRef.orderBy('date', descending: true).limit(1).get();
  String datereverse = '${_dateTime.month} ${_dateTime.day}';
if (querySnapshot.docs.isEmpty) {
  
  // No document available in graphRef collection
  if (attendance == false) {
    status = 0;
  }
  else  if (attendance == true){
status=1;
  }

}
else {
  // Document available in graphRef collection
  DocumentSnapshot lastDocumentSnapshot = querySnapshot.docs[0];
  int previousStatus = lastDocumentSnapshot['status'];
  status += previousStatus;
}
String periodString = period.toString().substring(period.toString().length - 1); // Extract last digit from period
if(periodString=='r'){
  periodString='7';
// String documentId2 = '${currentTime.year} ${currentTime.month} ${currentTime.day} ${currentTime.hour} ${currentTime.minute} ${currentTime.second}';
// DocumentReference graphDocRef = graphRef.doc(documentId2);
// await graphDocRef.set({
//   'dateandperiod': "$date $periodString",
//   'date':date,
//   'period': period,
//   'status': status,
// });
}
DocumentReference graphDocRef = graphRef.doc(documentId);
await graphDocRef.set({
  
  'dateandperiod': "$datereverse $periodString",
  'date':date,
  'period': period,
  'status': status,
});
          //  await professorDetailsRef.set({'attendanceList': attendanceList});

          await professorDetailsRef.set({
            'TotalClasses': totalClasses,
            'subject': subjectName,
            'present': presentCount,
            'absent': totalClasses - presentCount,
          });
          //adding TotalClasses to student's portal
          DocumentSnapshot professorDetailsSnapshot =
              await deptRef.doc(subjectName).get();
          int previousTotalClasses2 =
              professorDetailsSnapshot['TotalClasses'] ?? 0;
          int totalClasses2 = previousTotalClasses2 + 1;
          await FirebaseFirestore.instance
              .collection('Student')
              .doc(dept)
              .collection(yrs)
              .doc(docId)
              .set({
            'totalof $subjectName': totalClasses,
            'presentof $subjectName': presentCount
          }, SetOptions(merge: true));

          //
        }
        // for (QueryDocumentSnapshot doc in dptdetailsDocuments) {
        //   String docId = doc.id;
        //   await FirebaseFirestore.instance
        //       .collection('Student')
        //       .doc(dept)
        //       .collection(yrs)
        //       .doc(docId)
        //       .update({'totalpresent': cumulativeTotalClasses});
        // }
      } else {
        await teacherDocRef.set({'TotalClasses': 1});
        QuerySnapshot dptdetailsSnapshot = await dptdetails.get();
        List<QueryDocumentSnapshot> dptdetailsDocuments =
            dptdetailsSnapshot.docs;
        for (QueryDocumentSnapshot doc in dptdetailsDocuments) {
          String docId = doc.id;
          CollectionReference deptRef = FirebaseFirestore.instance
              .collection('Student')
              .doc(dept)
              .collection(yrs)
              .doc(docId)
              .collection('ListOfSub');
          DocumentReference professorDetailsRef = deptRef.doc(subjectName);
          await professorDetailsRef.set({
            'TotalClasses': 1,
            'subject': subjectName,
          });
        }
      }
      Navigator.of(context).pop(); // Close the loading dialog

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Successfully added")),
      );

      //  Navigator.of(context).pop();
    } catch (e, stackTrace) {
      print('Error: $e'); // Print the error for debugging purposes
      print(
          'Stack Trace: $stackTrace'); // Print the stack trace for debugging purposes

      if (e.toString().contains('Document does not exist')) {
        // Handle the case where the document doesn't exist
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("The document doesn't exist")),
        );
      } else {
        // Handle other errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("An error occurred. Please try again.")),
        );
      }
    }
    
    print(recipents);
      if (recipents.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No absentees 🌟")),
      );
      return;
    }
    else{
   _sendSMS("Hi..! This is a friendly reminder from our class that we missed you today. We hope you're doing well and nothing serious is keeping you away. Remember, we covered some important topics in class, so it would be great if you could catch up on the material as soon as possible. If you have any questions or need any notes, feel free to reach out to any of us. We look forward to seeing you back in class soon! Take care and have a great day!", recipents);
    }
   resetBoolValues(dept, yrs);
  }

  resetBoolValues(dept, yr) async {
    final CollectionReference dptdetails = FirebaseFirestore.instance
        .collection('Student')
        .doc(dept)
        .collection(yr);

    dptdetails.get().then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        doc.reference.update({'attendance': false});
      }
    });
  }
  
void _sendSMS(String message, List<String> recipents) async {
  String _result = await sendSMS(message: message, recipients: recipents)
      .catchError((onError) {
    print(onError);
  });
  print(_result);
}
}
