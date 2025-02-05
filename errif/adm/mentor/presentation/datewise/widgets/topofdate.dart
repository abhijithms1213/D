import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'bottumofdate.dart';
import 'listtile.dart';

class WidgetTopOfDate extends StatelessWidget {
  const WidgetTopOfDate({
    super.key,
    required this.heightofscreen,
    required this.widthofscreen,
    required this.dept,
    required this.yrs,
    required this.userId,
  });

  final double heightofscreen;
  final double widthofscreen;
  final String dept;
  final String yrs;
  final String userId;

  Widget build(BuildContext context) {
    return Container(
      height: heightofscreen * .22,
      width: widthofscreen,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: heightofscreen * .09,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SizedBox(
              width: widthofscreen,
              height: widthofscreen * .16,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children:const [
                   Text(
                    "Attendence List",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "you can view the entire class taken from the date by clicking the tile",
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.white24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: heightofscreen * .02,
          ),
          Container(
            height: heightofscreen * .03,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
