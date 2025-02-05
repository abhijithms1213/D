
import 'package:flutter/material.dart';

import '../../../cores/colors/color.dart';

class WidgetMid extends StatelessWidget {
  const WidgetMid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32))),
      alignment: Alignment.center,
      //Center scrolling
      child: Container(
        width: 40,
        height: 5,
       
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colorHomeMidContainer,),
      ),
    );
  }
}
