import 'package:flutter/material.dart';
import 'package:poyo/Presentation/Widgets/homeWidgets/LowerPortion.dart';
import 'package:poyo/Presentation/Widgets/homeWidgets/MidScrolling.dart';
import 'package:poyo/Presentation/Widgets/homeWidgets/upperAll.dart';
import 'package:poyo/cores/colors/color.dart';


class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
 //   final Size size = MediaQuery.of(context).size;
    return const Scaffold(
        body: SafeArea(
      //Top area
      child:  CustomScrollView(
        slivers:  [
           SliverAppBar(
            backgroundColor: colorHomeUpper,
            pinned: false,
            expandedHeight: 390,
            collapsedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              //Top Portions
              background: WidgetHomeTopAll(),
            ),
            //Center
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: WidgetMid(),
            ),
          ),
          //BottomSheet
          SliverToBoxAdapter(
            child: WidgetLowerAll(),
          ),
        ],
      ),
    ));
  }
}
