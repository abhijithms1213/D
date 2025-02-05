import 'package:admin_portal01/services/functions/studentsauthfuncion.dart';
import 'package:flutter/material.dart';
import '../constants/const.dart';

class SCreenEditStudentByButton extends StatefulWidget {
  const SCreenEditStudentByButton({super.key});

  @override
  State<SCreenEditStudentByButton> createState() =>
      _SCreenEditStudentByButtonState();
}

class _SCreenEditStudentByButtonState extends State<SCreenEditStudentByButton> {
  final _formKey = GlobalKey<FormState>();
  bool check = true;
  String email = '';
  String password = '';
  String fullname = '';
  String phno = '';
  String regId = '';
  String subname = '';
  bool login = false;
  bool allEqual = true;
  List<String>? dispText;

  final List<int> departmentcount = [1, 2, 3, 4, 5, 6];

  int? selectedepartmentcount = 1;

  final yearsListofStudent = [
    '2nd',
    '3rd',
    '4th',
  ];
  String selectedYearofStudent = '2nd';

  final departmentListofStudent = ['CSE', 'CIVIL', 'MECH', 'EC', 'EI', 'EEE'];

  String selectedDepartmentofStudent = 'CSE';
  //String selectedDepartmentofStudent2=selectedDepartmentofStudent!;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Edit"),
        backgroundColor: Colors.black38,
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
            child: ListView(
              children: [
                SizedBox(
                  height: size.height * .1,
                  child: const Center(
                    child: Text(
                      "Enter The Student Data",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TextFormField(
                  key: const ValueKey('fullname'),
                  decoration: InputDecoration(
                    hintText: "Enter The Student Name",
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
                      fullname = value!;
                    });
                  },
                ),
                SizedBox(
                  height: size.height * .04,
                ),
                   TextFormField(
                  key: const ValueKey('phno'),
                  decoration: InputDecoration(
                    hintText: "Enter The phone number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter ';
                    }
                    else if(value.length < 10){
                      return 'enter a valid phone no';
                    }
                     else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      phno = value!;
                    });
                  },
                ),
                SizedBox(
                  height: size.height * .04,
                ),
                   TextFormField(
                    textCapitalization: TextCapitalization.characters,
                  key: const ValueKey('regId'),
                  decoration: InputDecoration(
                    hintText: "Enter The Register Id",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Reg Id';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      regId = value!;
                    });
                  },
                ),
                SizedBox(
                  height: size.height * .04,
                ),
                TextFormField(
                  key: const ValueKey('email'),
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
                      email = value!;
                    });
                  },
                ),
                SizedBox(
                  height: size.height * .04,
                ),
                TextFormField(
                  key: const ValueKey('password'),
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
                      password = value!;
                    });
                  },
                ),
                SizedBox(
                  height: size.height * .04,
                ),

                SizedBox(
                  height: size.height * .03,
                ),
                khbox20,
                const Text("Department: "),
                khbox20,
                //department grid tail
                SizedBox(
                    height: size.height * .1,
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      value: selectedDepartmentofStudent,
                      elevation: 4,
                      items: departmentListofStudent
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (value) {
                        selectedDepartmentofStudent = value!;

                        print(selectedDepartmentofStudent);
                        //onApplyButtonPressed();
                      },
                    )),
                SizedBox(
                  height: size.height * .03,
                ),
                //year of every dpt
                khbox20,
                SizedBox(
                  height: size.height * .22,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("select year"),
                      khbox10,
                      SizedBox(
                        width: size.width * .27,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(1),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          value: selectedYearofStudent,
                          elevation: 4,
                          items: yearsListofStudent
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            selectedYearofStudent = value!;
                            print(selectedYearofStudent);
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      AuthServicesOfStudent.signupUser(
                          email,
                          password,
                          fullname,
                          regId,
                          selectedDepartmentofStudent,
                          selectedYearofStudent,
                          phno,
                          context);
                    }
                  },
                  child: Container(
                    width: size.width,
                    height: size.height * .05,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(115, 197, 186, 186),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text("Apply"),
                    ),
                  ),
                ),
                khbox20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
