
import 'package:flutter/material.dart';
import 'package:poyo/cores/colors/color.dart';
import 'package:poyo/cores/constants/const.dart';

class WidgetBusTrackingMiddle extends StatelessWidget {
  const WidgetBusTrackingMiddle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:30.0),
      child: Row(
        children: [
        const Image(image: AssetImage("assets/images/My project.png",),height: 30,width: 30,),
        kwbox5,
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text("current location",style: TextStyle(color: colorBlkOp2,fontSize: 12),),
            khbox2,
            Text("Uriyakkod,Near Sarabhai",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)],
          )
        ],
      ),
    );
  }
}