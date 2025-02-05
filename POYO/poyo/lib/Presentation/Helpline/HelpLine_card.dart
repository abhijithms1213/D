import 'package:flutter/material.dart';
import 'package:poyo/cores/constants/const.dart';

class WidgetHelpCard extends StatelessWidget {
  const WidgetHelpCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * .09,
 
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          kwbox10,
          Text("My phn no: is 2255"),
          kwbox10,
        ],
      ),
    );
  }
}
