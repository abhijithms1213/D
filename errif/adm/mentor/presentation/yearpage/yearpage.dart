import 'package:flutter/material.dart';
import 'package:mentor_app/presentation/yearpage/widgets/bottomofyear.dart';
import 'package:mentor_app/presentation/yearpage/widgets/topofyear.dart';

class ScreenYear extends StatelessWidget {
  const ScreenYear({super.key, required this.uid, required this.dptname});

  final String uid;
  
 final String dptname;
  @override
  Widget build(BuildContext context) {
    final widthofscreen = MediaQuery.of(context).size.width;
    final heightofscreen = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetTopOfYearPage(
              widthofscreen: widthofscreen, heightofscreen: heightofscreen),
          WidgetBottomOfYearPage(
            heightofscreen: heightofscreen,
            uid: uid, deptName: dptname,
          )
        ],
      ),
    );
  }
}
