import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:poyo/Presentation/Widgets/BusTrackingWidgets/BottomTexts.dart';
import 'package:poyo/Presentation/Widgets/BusTrackingWidgets/MiddleWidget.dart';
import 'package:poyo/cores/colors/color.dart';
import 'package:poyo/cores/constants/const.dart';

class ScreenLiveTracking extends StatelessWidget {
  const ScreenLiveTracking({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 248, 255, 251),
      backgroundColor: colorHomeUpper,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const Text("Bus Tracking"),
                IconButton(onPressed: () {}, icon: const Icon(Icons.remove_rounded)),
              ],

            ),
            khbox30,
            //map
            Container(
              width: size.width,
              height: size.height * .40,
              decoration: BoxDecoration(
                 
                  borderRadius: BorderRadius.circular(70),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/mappings.jpg"),
                      fit: BoxFit.fill)),
            ),
            khbox20,
            //center
            WidgetBusTrackingMiddle(),
            khbox20,
            Stack(
              //BottomContainer
              children: [
                Container(
                  width: double.infinity,
                  height: size.height * .35,
                  decoration: BoxDecoration(
                      color: colorwhite,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0,right: 10,bottom: 28),
                        //SideLine
                        child: Container(
                          width: .1,
                          height: size.height * .17,
                          color: colorblack,
                        ),
                      ),
                      kwbox20,
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: WidgetBottomTexts(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
