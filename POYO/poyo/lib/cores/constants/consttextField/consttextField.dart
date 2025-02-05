import 'package:flutter/material.dart';
import 'package:poyo/cores/colors/color.dart';
import 'package:poyo/cores/constants/const.dart';

class WidgetListCommonDepotBus extends StatelessWidget {
  WidgetListCommonDepotBus({
    super.key,
  
    required this.leadingbox,
    required this.subtext1,
    required this.subtext2,
    required this.infotext,
    required this.ico,
  });
 
  final String leadingbox;
  final String subtext1;
  final subtext2;
  final String infotext;
  final ico;
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //depot heading
      children: [
    
        khbox15,
        Padding(
          padding: const EdgeInsets.only(right:8.0,left: 6),
          child: Container(
            width: size.width *.95,
            height: size.height *.1,
            
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
        
            border: Border.all(color: colorBlkOp1,),),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Container(
                    //Inner Box
                    width:
                     size.width*.125,
                    height:    size.width*.125,
                    decoration: BoxDecoration(color: colorTinyBox,
                    borderRadius: BorderRadius.circular(5))
                    ,child: Center(child: ico),
                  ),
                ),
                kwbox20,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(leadingbox,style: const TextStyle(fontWeight: FontWeight.bold),),
                    khbox6,
                    Row(
                      children: [
                        Text(subtext1,style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 12),),
                        kwbox5,
                        Text(
                          subtext2,style: const TextStyle(color: Colors.red,fontSize: 13),
                        ),
                      ],
                    ),
                    khbox4,
                    Text(infotext,style: const TextStyle(color: Color.fromARGB(255, 216, 216, 216)),),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
