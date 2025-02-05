import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poyo/cores/colors/color.dart';
import 'package:poyo/cores/commonb.dart';
import 'package:poyo/cores/constants/const.dart';
import 'package:poyo/cores/constants/consttextField/consttextField.dart';
import 'package:poyo/cores/constants/consttextField/leadingText.dart';

class ScreenDepotList extends StatelessWidget {
  const ScreenDepotList({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              //Initial imagets and etc,...

              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: double.infinity,
                    height: size.height * .3,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/depot.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: size.width * .13,
                  top: size.height * .11,
                  child: Text(
                    "Depot List",
                    style: GoogleFonts.notoSerifSinhala(
                        color: colorwhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                kwbox10,
                Positioned(
                  left: size.width * .13,
                  top: size.height * .15,
                  child:  SizedBox(
                    width: size.width*.7,

                    //confusion in height
                    height: size.height*.3,
                    child:  const Text(
                      "A depot is a transport system's operating base,it provides packing service and maintenance Busue",
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                //row buttons
                CommonButtons(
                  back: const Icon(
                    Icons.arrow_back,
                    color: colorwhite,
                  ),
                  search: const Icon(
                    Icons.search,
                    color: colorwhite,
                  ),
                ),
              ],
            ),
            const LeadingHeading(leading: "Detailed List."),
            kwbox10,
            //Box
            SizedBox(
              width: size.width,
              height: size.height * .57,
              child: ListView.separated(
                  itemBuilder: (ctx, item) {
                    return WidgetListCommonDepotBus(
                      infotext: "currently unavailable",
                      leadingbox: "Vellanad Depot",
                      subtext1: "Phone No: ",
                      subtext2: "912342XXXX",
                      ico: const Text("data"),
                    );
                  },
                  separatorBuilder: (ctx, index) {
                    return kspace5;
                  },
                  itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}
