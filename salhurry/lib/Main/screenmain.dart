import 'package:flutter/material.dart';
import 'package:salhurry/presentation/Earnings/earnings.dart';
import 'package:salhurry/presentation/Notifications/notification.dart';
import 'package:salhurry/presentation/Search/search.dart';
import 'package:salhurry/presentation/bottomNavBAr/Bottom.dart';
import 'package:salhurry/presentation/home/home.dart';
import 'package:salhurry/profilefromdemo/profile.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});
  // ValueNotifier<int> notif = ValueNotifier(1);
  final List screens = [
    const ScreenHome(),
   JobListingScreen(),
    const ScreenNotification(),
    const ScreenEarnings(),
     const ScreenProfilee(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: values,
            builder: (context, int news, child) {
              return screens[news];
            }),
      ),
      bottomNavigationBar: const Bottom2nav(),
    );
  }
}
