import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poyo/cores/colors/color.dart';
import 'package:poyo/cores/constants/consttextField/leadingText.dart';

import '../../../cores/commonb.dart';
import '../../../cores/constants/const.dart';

class WidgetTopStack extends StatelessWidget {
  const WidgetTopStack({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * .37,
      child: Stack(
        children: [
          Transform.rotate(
            angle: -10 * pi / 180,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: double.infinity,
                height: size.height * .3,
                decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    color:colorBlkOp2,),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: size.height * .3,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
    
              image: DecorationImage(image: AssetImage("assets/images/timing.jpg"),fit: BoxFit.cover),
            ),
          ),
          Positioned(
            left: 233,
            top: 100,
            child: Text(
              "Bus Timing",
              style: GoogleFonts.notoSerifSinhala(
                  color: colorwhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              textAlign: TextAlign.right,
            ),
          ),
          kwbox10,
           Positioned(
            left: size.width *.125,
            top: size.height *.15,
            child: const SizedBox(
              width: 300,
              height: 80,
              child: Text(
                "A depot is a transport system's operating base,it provides packing service and maintenance Busue",
                textAlign: TextAlign.right,
              ),
            ),
          ),
          const Align(
              alignment: Alignment.bottomLeft,
              child: LeadingHeading(leading: "All Listed Info")),
                CommonButtons(back: const Icon(Icons.arrow_back,color: colorwhite,), 
                search: const Icon(Icons.search,color: colorwhite,)),
        ],
      ),
    );
  }
}
