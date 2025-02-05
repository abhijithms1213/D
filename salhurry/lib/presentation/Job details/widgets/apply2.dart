import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class WidgetApplyButton extends StatefulWidget {
  const WidgetApplyButton({
    Key? key,
    required this.width,
    required this.height,
    required this.documentSnapshots,
  }) : super(key: key);

  final double width;
  final double height;
  final String documentSnapshots;

  @override
  WidgetApplyButtonState createState() => WidgetApplyButtonState();
}

class WidgetApplyButtonState extends State<WidgetApplyButton> {
  bool isLoading = false;
  bool oppoisloading = false;
  Key loadingKey = UniqueKey();
  late Stream<bool> isAppliedStream;
  // late bool apply;

  @override
  void initState() {
    super.initState();
    isAppliedStream = FirebaseFirestore.instance
        .collection('newjobs')
        .doc(widget
            .documentSnapshots) // Provide the document ID where isApplied is stored
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>;
        return data['isApplied'] ?? false;
      } else {
        return false;
      }
    });
    // apply=isAppliedStream as bool;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: isAppliedStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Show loading indicator while fetching data
        }

        final bool isApplied = snapshot.data ?? false;

        return isApplied
            ? Container()
            // If isApplied is true, don't show the button
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {
                    dialogue(context);
                  },
                  child: Container(
                    width: widget.width * 1,
                    height: widget.height * 0.05,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 66, 32, 178),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        "Apply Now",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }

  void dialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            // oppoisloading = !isLoading;
            return GiffyDialog.image(
              isLoading
                  ?
                  // Image.network(
                  //     "assets/images/loading.gif",
                  //     key: loadingKey,
                  //     height: 200,
                  //     fit: BoxFit.cover,
                  //   )
                  Image.asset(
                      "assets/images/loading.gif",
                      key: loadingKey,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : oppoisloading
                      ? Image.asset(
                          "assets/images/done.gif",
                          height: 200,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          "https://i.pinimg.com/originals/8a/2e/4c/8a2e4c79a1b9c983dc6bf8d6cbada43a.gif",
                          height: 200,
                          fit: BoxFit.cover,
                        ),
              title: const Text(
                '\nCONFIRMATION!',
                textAlign: TextAlign.center,
              ),
              content: isLoading
                  ? const Text(
                      'working on it...',
                      textAlign: TextAlign.center,
                    )
                  : oppoisloading
                      ? const Text(
                          'Completed!',
                          textAlign: TextAlign.center,
                        )
                      : const Text(
                          'Are you sure you want to apply for this job?',
                          textAlign: TextAlign.center,
                        ),
              actions: isLoading
                  ? []
                  : oppoisloading
                      ? [
                          // If applied, only show the "OK" button
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OKey'),
                          ),
                        ]
                      : [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'CANCEL'),
                            child: const Text(
                              'CANCEL',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 132, 18, 9)),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                isLoading = true;
                                oppoisloading = isLoading;
                              });
                              // Simulate applying for the job
                              // You would update the Firestore document here

                              Future.delayed(const Duration(seconds: 3), () {
                                setState(() {
                                  isLoading = false;
                                });
                                // Set isApplied to true after applying
                                FirebaseFirestore.instance
                                    .collection('newjobs')
                                    .doc(widget.documentSnapshots)
                                    .update({'isApplied': true});
                                getCurrentUserEmailAndSetDocument();
                              });
                            },
                            child: Container(
                              width: 60,
                              height: 40,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(79, 15, 169, 35),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text(
                                  'OK',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
              entryAnimation: EntryAnimation.bottom,
              giffyPadding: const EdgeInsets.all(0),
            );
          },
        );
      },
    );
  }

  void getCurrentUserEmailAndSetDocument() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    if (auth.currentUser != null) {
      String email = auth.currentUser!.email!;
      print('Current user email: $email');

      try {
        await setDocumentInFirestore(firestore, email);
      } catch (e) {
        print('Error setting document: $e');
      }
    } else {
      print('No user signed in.');
    }
  }

  Future<void> setDocumentInFirestore(
      FirebaseFirestore firestore, String email) async {
    await firestore
        .collection(email)
        .doc('ActiveListOF$email')
        .collection("active_list")
        .doc()
        .set({
      'Actived': true,
    });
    print('Document set successfully.');
  }
}
