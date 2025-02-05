import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poyo/Presentation/Bustiming/Bustiming.dart';
import 'package:poyo/Presentation/DepotList/Depotlist.dart';
import 'package:poyo/Presentation/Helpline/Help_line.dart';
import 'package:poyo/cores/colors/color.dart';
import 'package:poyo/cores/constants/const.dart';

class ScreenListWidget extends StatelessWidget {
  ScreenListWidget(
      {super.key,
      required this.imgText,
      required this.listTex,
      required this.textDescription,
      required this.listvalue});
  String listTex;
  String imgText;
  String textDescription;
  final int listvalue;
  List featuresList = [
    const ScreenDepotList(),
    const ScreenBusTiming(),
    const ScreenHelpLine(),
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return featuresList[listvalue];
            },
            //ned to change
          ),
        );
      },
      child: Container(
        width: size.width * .9,
        height: size.height * .092,
        color: colorwhite,
        child: Stack(children: [
          Row(
            children: [
              //SizedBox(width: 40,),
              Container(
                // width: 110,
                width: size.width * .28,
                height: size.height * .092,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color.fromARGB(255, 135, 135, 135)),
                  image: DecorationImage(
                      image: AssetImage(imgText), fit: BoxFit.cover),
                ),
              ),
              kwbox20,
              Column(
                  mainAxisAlignment: MainAxisAlignment
                      .start, 
                  children: [
                    Text(
                      listTex,
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ])
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 130.0, top: 30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    textDescription,
                    style: GoogleFonts.athiti(),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
