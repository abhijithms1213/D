import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salhurry/Main/screenmain.dart';

class TextfieldWidget extends StatefulWidget {
  TextfieldWidget({
    super.key,
    required this.height,
    required this.hintTextEmail,
    required this.hintTextPass, required this.signInOrup, required this.buttonText,

    // required this.email,
    // required this.pass,
  });

  final double height;
  final String hintTextEmail;
  final String hintTextPass;
    final String signInOrup;
  final String buttonText;

  final _firestore = FirebaseFirestore.instance;

  String email = '';
  String pass = '';

  @override
  State<TextfieldWidget> createState() => _TextfieldWidgetState();
}

class _TextfieldWidgetState extends State<TextfieldWidget> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children: [
        Container(
          decoration: BoxDecoration(
              // color: Colors.grey[100],
              color: const Color.fromARGB(255, 246, 246, 246),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: TextField(
              //controller: _password,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                widget.email = value;
              },
              decoration: InputDecoration(
                hintText: widget.hintTextEmail,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(
          height: widget.height * .02,
        ),
        //password
        Container(
          decoration: BoxDecoration(
              // color: Colors.grey[100],
              color: const Color.fromARGB(255, 246, 246, 246),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: TextField(
              //controller: _password,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                widget.pass = value;
              },
              decoration: InputDecoration(
                hintText: widget.hintTextPass,
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(
          height: widget.height * .02,
        ),
        InkWell(
          onTap: () async {
            setState(() {
              showSpinner = true;
            });
            //Login to existing account
          
            try {
              if (widget.signInOrup == 'Login') {
                await _auth.signInWithEmailAndPassword(
                  email: widget.email,
                  password: widget.pass,
                );
              } else if (widget.signInOrup == 'Register') {
                await _auth.createUserWithEmailAndPassword(
                  email: widget.email,
                  password: widget.pass,
                );
                   // Create Firestore collection with user's email as its name
                // await widget._firestore.collection(widget.email).doc('ActiveListOF${widget.email}').collection("active_list").doc()  
                // .set({
                //   'test': 'Done',
                // });
              }

              setState(() {
                showSpinner = false;
              });

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ScreenMain(),
                ),
              );
              print('Operation successful');
            } catch (e) {
              print(e);
                print(widget.email);
            }
          },
          child: Container(
            height: widget.height * .055,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 66, 32, 178),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                widget.buttonText,
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
