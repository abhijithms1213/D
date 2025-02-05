import 'package:flutter/material.dart';
import 'package:poyo/Presentation/Helpline/HelpLine_card.dart';
import 'package:poyo/cores/colors/color.dart';

class WidgetListView extends StatelessWidget {
  const WidgetListView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color.fromARGB(255, 239, 243, 255),Color.fromARGB(255, 222, 235, 247)],
          ),
        ),
   
        width: double.infinity,
        height: size.height * .56,
        child: ListView.separated(
            itemBuilder: (context, item) {
              return const WidgetHelpCard();
            },
            separatorBuilder: (context, item) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30, top: 10, bottom: 10),
                child: Container(
                  width: 5,
                  color: colorRowFav,
                  height: .5,
                ),
              );
            },
            itemCount: 20),
      ),
    );
  }
}
