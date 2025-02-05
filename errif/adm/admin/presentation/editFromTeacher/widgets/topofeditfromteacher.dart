import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WidgetTopOfEditButtonFromTeacher extends StatefulWidget {
   String email;
  String password;
  String fullname;
  String subname;
   WidgetTopOfEditButtonFromTeacher({super.key,required this.email,required this.password,required this.fullname,required this.subname,});

  @override
  State<WidgetTopOfEditButtonFromTeacher> createState() => _WidgetTopOfEditButtonFromTeacherState();
}

class _WidgetTopOfEditButtonFromTeacherState extends State<WidgetTopOfEditButtonFromTeacher> {
  
  @override
  Widget build(BuildContext context) {
    
    final Size size = MediaQuery.of(context).size;
    return Column(children: [
       SizedBox(
                  height: size.height * .1,
                  child: const Center(
                    child: Text(
                      "Enter The Professor Data",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ElevatedButton(onPressed:() {
                 
                   
                }, child: Icon(Icons.add)),
                TextFormField(
                  key: ValueKey('fullname'),
                  decoration: InputDecoration(
                    hintText: "Enter The Professor Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Full Name';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      widget.fullname = value!;
                    });
                  },
                ),
                SizedBox(
                  height: size.height * .04,
                ),
                TextFormField(
                  key: ValueKey('email'),
                  decoration: InputDecoration(
                    hintText: "Enter The Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please Enter valid Email';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      widget.email = value!;
                    });
                  },
                ),
                SizedBox(
                  height: size.height * .04,
                ),
                TextFormField(
                  key: ValueKey('password'),
                  decoration: InputDecoration(
                    hintText: "Enter The password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'Please Enter Password of min length 6';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      widget.password = value!;
                    });
                  },
                ),
                SizedBox(
                  height: size.height * .04,
                ),
                TextFormField(
                  key: ValueKey('subname'),
                  decoration: InputDecoration(
                    hintText: "Subjects Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter atleast minimum characters';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      widget.subname = value!;
                    });
                  },
                ),
    ],);
  }
 aply(){
   return widget.email;
  }
}