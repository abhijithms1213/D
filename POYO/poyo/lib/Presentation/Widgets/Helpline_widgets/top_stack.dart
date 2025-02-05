import 'package:flutter/material.dart';
import 'package:poyo/cores/colors/color.dart';
import 'package:poyo/cores/commonb.dart';

class ScreenTop extends StatelessWidget {
  ScreenTop({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: size.height * .3,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                image: DecorationImage(
                    image: AssetImage(
                        "assets/images/pawel-czerwinski-OY3slACa3ec-unsplash.jpg"))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * .7,
                  height: size.height * .2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                          image: AssetImage(
                              "assets/images/business_hand_robot_handshake_artificial_intelligence_digital_transformation.jpg"),
                          fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
          CommonButtons(
            back: Icon(
              Icons.arrow_circle_left,
              color: colorwhiteOp3,
            ),
            search: Icon(
              Icons.sort,
              color: colorwhiteOp3,
            ),
          ),
        ],
      ),
    );
  }
}
