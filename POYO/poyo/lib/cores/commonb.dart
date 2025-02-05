import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CommonButtons extends StatelessWidget {
   CommonButtons({super.key,required this.back,required this.search});
final Icon back;
final Icon search;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25,right: 25,top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        IconButton(onPressed: (){Navigator.of(context).pop();}, icon: back),
        IconButton(onPressed: (){}, icon: search),
      ],),
    );
  }
}