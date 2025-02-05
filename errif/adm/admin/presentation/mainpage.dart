import 'package:admin_portal01/auth/login.dart';
import 'package:admin_portal01/presentation/studentUI/studentui.dart';
import 'package:admin_portal01/presentation/teachersUi.dart';
import 'package:flutter/material.dart';

import 'bottom/bottomnav.dart';

const List screens = [

  ScreenTeacher(),
ScreenStudent(),
];

class ScreenMain extends StatelessWidget {
  const ScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: val,
      builder: (context, value, child) {
        return Scaffold(
        
          body: screens[val.value],
          bottomNavigationBar: const ScreenBottom(),
        );
      },
    );
  }
}
