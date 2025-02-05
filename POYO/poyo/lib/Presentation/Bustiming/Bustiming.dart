import 'package:flutter/material.dart';
import 'package:poyo/Presentation/Widgets/BusTiming/widget_top_stack.dart';
import 'package:poyo/cores/constants/const.dart';
import 'package:poyo/cores/constants/consttextField/consttextField.dart';

class ScreenBusTiming extends StatelessWidget {
  const ScreenBusTiming({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const WidgetTopStack(),
            kwbox10,
            SizedBox(
              width: size.width,
              height: size.height * .56,
              child: ListView.separated(
                  itemBuilder: ((context, index) {
                    return WidgetListCommonDepotBus(
                      leadingbox: "Vellanad-Nedumangad",
                      subtext1: "Timing:",
                      subtext2: "08.00-04.30",
                      infotext: "No new Info",
                      ico: const Icon(Icons.point_of_sale),
                    );
                  }),
                  separatorBuilder: (context, index) {
                    return kspace5;
                  },
                  itemCount: 10),
            )
          ],
        ),
      ),
    );
  }
}
