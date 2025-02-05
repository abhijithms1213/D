import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:poyo/Presentation/BottomNav/Bottom2.dart';
import 'package:poyo/Presentation/Bustiming/Bustiming.dart';
import 'package:poyo/Presentation/DepotList/Depotlist.dart';
import 'package:poyo/Presentation/Helpline/Help_line.dart';
import 'package:poyo/Presentation/HomePage/ScreenHome.dart';
import 'package:poyo/Presentation/LiveTracking/livetrack.dart';
import 'package:poyo/Presentation/Settings/ScreenSettings.dart';
import 'package:poyo/Presentation/Map/Map.dart';
import 'package:poyo/cores/constants/consttextField/consttextField.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});
 // ValueNotifier<int> notif = ValueNotifier(1);
  List Screens = [
   const ScreenMap(),
  const  ScreenHome(),
   const ScreenSettings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: values,
          builder: (context,int news, child) {
            
            return Screens[news];
          }),
      bottomNavigationBar:
          
          Bottom2nav(),
    );
  }
}
