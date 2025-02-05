import 'package:flutter/material.dart';
import 'package:poyo/Presentation/Widgets/homeWidgets/BottomRowFav.dart';
import 'package:poyo/cores/colors/color.dart';

class ScreenFav extends StatelessWidget {
  const ScreenFav({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      
      width: 170,
      height: 200,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 22),
            child: Container(
              // width: 120,
              // height: 140,
              width: size.width * .31,
              height: size.width * .36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 70, 7, 205).withOpacity(.4),
                border: Border.all(
                  color: colorBorderImg,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: size.width * .31,
              height: size.width * .36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colorwhite,
                border: Border.all(
                  color: colorBorderImg,
                ),
                image: const DecorationImage(
                    opacity: .8,
                    image: AssetImage(
                        "assets/images/Woman With Suitcase 2-01.jpg")),
              ),
            ),
          ),
          Container(
            width: size.width * .31,
            height: size.width * .36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorwhite,
              border: Border.all(
                color: Colors.black.withOpacity(.7),
              ),
              //  backgroundBlendMode: BlendMode.clear,
              image: const DecorationImage(
                  image: AssetImage(
                "assets/images/Woman With Suitcase 2-01.jpg",
              )),
            ),
          ),
      const    Positioned(
            bottom: -6,
            left: -9,
            right: 0,
            child: WidgetFavBottomRow(),
          )
        ],
      ),
    );
  }
}
