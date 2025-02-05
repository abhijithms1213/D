import 'package:flutter/material.dart';
import 'package:salhurry/presentation/create%20account/widgets/bottom_row.dart';
import 'package:salhurry/presentation/create%20account/widgets/common_top.dart';
import 'package:salhurry/presentation/create%20account/widgets/textfield.dart';
import 'package:salhurry/presentation/login%20page/login.dart';

class ScreenCreateAccount extends StatelessWidget {
  const ScreenCreateAccount({super.key});
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
              getText: "Create an account",
            ),
            SizedBox(
              height: height * .03,
            ),
            // textfields
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
               
                TextfieldWidget(height: height, hintTextEmail: "Email", hintTextPass: "Pass", signInOrup: 'Register', buttonText: 'Create Account',)
                // WidgetTextField(height: height, hintTextEmail: "hintTextEmail", hintTextPass: "hintTextPass")
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.mark_as_unread),
                SizedBox(
                  width: width * .015,
                ),
                const Text("terms and conditions")
              ],
            ),
            SizedBox(
              height: height * .034,
            ),
            BottomRowWidget(width: width,leading: "Already have an account?",tail: "Login",Screen: ScreenLogin(),),
          ],
        ),
      )),
    );
  }
}
