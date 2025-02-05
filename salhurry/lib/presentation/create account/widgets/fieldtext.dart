import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salhurry/Main/screenmain.dart';

class WidgetTextField extends StatefulWidget {
  WidgetTextField({
    Key? key,
    required this.height,
    required this.hintTextEmail,
    required this.hintTextPass,
  }) : super(key: key);

  final double height;
  final String hintTextEmail;
  final String hintTextPass;

  String email = '';
  String pass = '';

  String confirmPass = ''; // New property for confirmation password

  @override
  State<WidgetTextField> createState() => _WidgetTextFieldState();
}

class _WidgetTextFieldState extends State<WidgetTextField> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        // Confirmation Password
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 246, 246, 246),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: TextField(
              // obscureText: true,
              // keyboardType: TextInputType.text,
              onChanged: (value) {
                setState(() {
                  widget.confirmPass = value;
                });
              },
              decoration: const InputDecoration(
                hintText: '      Confirm Password',
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
            // Validate email and password
            if (widget.email.isEmpty || widget.pass.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please enter email and password.'),
                ),
              );
              print(widget.email);
              return;
            }

            // Check if passwords match
            if (widget.pass != widget.confirmPass) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Passwords do not match.'),
                ),
              );
              print(widget.email);

              return;
            }

            setState(() {
              showSpinner = true;
            });

            // Create account with email and password
            try {
              await _auth.createUserWithEmailAndPassword(
                email: widget.email,
                password: widget.pass,
              );
              setState(() {
                showSpinner = true;
              });
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ScreenMain(),
                ),
              );
              print('Successfully created account');
              print(widget.email);
            } catch (e) {
              print(e);
              setState(() {
                showSpinner = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Failed to create account. Please try again.'),
                ),
              );
            }
          },
          child: Container(
            height: widget.height * .055,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 66, 32, 178),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                "Create Account",
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
