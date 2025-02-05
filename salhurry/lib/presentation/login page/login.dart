import 'package:flutter/material.dart';
import 'package:salhurry/presentation/create%20account/create_acc.dart';
import 'package:salhurry/presentation/create%20account/widgets/bottom_row.dart';
import 'package:salhurry/presentation/create%20account/widgets/common_top.dart';
import 'package:salhurry/presentation/create%20account/widgets/textfield.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({super.key});
  // final _password = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginTopWidget(
              height: height,
              width: width,
              getText: "Login",
            ),
            SizedBox(
              height: height * .03,
            ),
            // textfields
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextfieldWidget(
                    height: height,
                    hintTextEmail: "      Enter your email ",
                    hintTextPass: "      Enter your password ", signInOrup: 'Login', buttonText: 'Login',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * .034,
            ),
            
            SizedBox(
              height: height * .01,
            ),
            BottomRowWidget(width: width, leading: "Don't have an account?", tail: "Create",Screen: ScreenCreateAccount(),)
          ],
        ),
      )),
    );
  }
}
