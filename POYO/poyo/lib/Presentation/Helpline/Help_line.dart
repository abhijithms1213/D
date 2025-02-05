import 'package:flutter/material.dart';
import 'package:poyo/Presentation/Helpline/Help_line_Listview.dart';
import 'package:poyo/Presentation/Widgets/Helpline_widgets/top_stack.dart';
import 'package:poyo/cores/constants/const.dart';



class ScreenHelpLine extends StatelessWidget {
  const ScreenHelpLine({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(255, 198, 217, 246),
                Color.fromARGB(255, 239, 247, 255)
              ],
            ),
          ),
          child: Column(
            children: [
              ScreenTop(),
             khbox20,
              const WidgetListView(),
            ],
          ),
        ),
      ),
    );
  }
}
