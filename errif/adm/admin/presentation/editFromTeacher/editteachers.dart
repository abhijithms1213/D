import 'package:admin_portal01/presentation/editFromTeacher/widgets/topofeditfromteacher.dart';
import 'package:flutter/material.dart';

import '../../services/functions/authFunctions.dart';
import '../constants/const.dart';

class SCreenEditTeachersByButton extends StatefulWidget {
  const SCreenEditTeachersByButton({super.key});

  @override
  State<SCreenEditTeachersByButton> createState() =>
      _SCreenEditTeachersByButtonState();
}

class _SCreenEditTeachersByButtonState
    extends State<SCreenEditTeachersByButton> {
  final _formKey = GlobalKey<FormState>();
  bool check = true;
  String email = '';
  String password = '';
  String fullname = '';
  String subname = '';
  String description = '';
  bool login = false;
  bool allEqual = true;
  List<String>? dispText;

  final List<int> departmentcount = [1, 2, 3, 4, 5, 6];

  int? selectedepartmentcount = 1;

  final yearsListofProfessor = [
    '2nd',
    '3rd',
    '4th',
    '2nd&3rd',
    '2nd&4th',
    '3rd&4th',
    '2nd&3rd&4th',
  ];
  String? selectedYearofProfessor;
  final List<List<String>> _selectedYearofProfessor = [];
  List<String> gettingValuesFromYear = [];

  final departmentListofProfessor = ['CSE', 'CIVIL', 'MECH', 'EC', 'EI', 'EEE'];

  String? selectedDepartmentofProfessor;
  final List<List<String>> _selectedDepartmentofProfessor = [];
  List<String> gettingValues = [];
  //final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 6; i++) {
      _selectedDepartmentofProfessor.add([]);
      _selectedYearofProfessor.add([]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Edit"),
        backgroundColor: Colors.black38,
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: ListView(
              children: [
                SizedBox(
                  height: size.height * .1,
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        gettingValues = _selectedDepartmentofProfessor
                            .where((list) => list.isNotEmpty)
                            .map((list) => list[0])
                            .toList();
                        print(gettingValues);
                      },
                      child: Text(
                        "Enter The Professor Data",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
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
                      fullname = value!;
                    });
                  },
                ),
                SizedBox(
                  height: size.height * .04,
                ),
                 TextFormField(
                  key: ValueKey('description'),
                  decoration: InputDecoration(
                    hintText: "Describe Professor within 2 sentences",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Atleast 1 sentence.';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      description = value!;
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
                      email = value!;
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
                      password = value!;
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
                      subname = value!;
                    });
                  },
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                Row(
                  children: [
                    Text("Department count"),
                    kwbox30,
                    SizedBox(
                      width: size.width * .15,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 243, 243, 243),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        value: selectedepartmentcount,
                        elevation: 4,
                        items: departmentcount
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e.toString()),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedepartmentcount = value;
                          });

                          if (selectedepartmentcount != null &&
                              selectedepartmentcount! <
                                  _selectedDepartmentofProfessor.length) {
                            _selectedDepartmentofProfessor.removeRange(
                                selectedepartmentcount!,
                                _selectedDepartmentofProfessor.length);

                            for (int i = 0; i < 6; i++) {
                              _selectedDepartmentofProfessor.add([]);
                            }
                          }
                          gettingValues = _selectedDepartmentofProfessor
                              .where((list) => list.isNotEmpty)
                              .map((list) => list[0])
                              .toList();
                          print("department gettingvalues:$gettingValues");
                          //year
                          if (selectedepartmentcount != null &&
                              selectedepartmentcount! <
                                  _selectedYearofProfessor.length) {
                            _selectedYearofProfessor.removeRange(
                                selectedepartmentcount!,
                                _selectedYearofProfessor.length);

                            for (int i = 0; i < 6; i++) {
                              _selectedYearofProfessor.add([]);
                            }
                          }
                          gettingValuesFromYear = _selectedYearofProfessor
                              .where((list) => list.isNotEmpty)
                              .map((list) => list[0])
                              .toList();
                          print("year gettingvalues:$gettingValuesFromYear");
                        },
                      ),
                    ),
                  ],
                ),
                khbox20,
                Text("Department: "),
                khbox20,
                //department grid tail
                SizedBox(
                  height: size.height * .2,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return DropdownButtonFormField(
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
                        // key: _formKey,
                        value: selectedDepartmentofProfessor,
                        elevation: 4,
                        items: departmentListofProfessor
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            _selectedDepartmentofProfessor[index] = [value];
                            print(_selectedDepartmentofProfessor);
                          }
                          gettingValues = _selectedDepartmentofProfessor
                              .where((list) => list.isNotEmpty)
                              .map((list) => list[0])
                              .toList();
                          print(gettingValues);
                          onApplyButtonPressed();
                          // if (value != null) {
                          //   _selectedDepartmentofProfessor[index] = [value];
                          //   print(_selectedDepartmentofProfessor);
                          // }
                          setState(() {
                            dispText = _selectedDepartmentofProfessor[index];
                          });
                        },
                      );
                    },
                    itemCount: selectedepartmentcount,
                  ),
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                Text("Select the year of every departments"),
                //year of every dpt
                khbox20,
                SizedBox(
                  height: size.height * .22,
                
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      dispText = _selectedDepartmentofProfessor[index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("dpt :${_selectedDepartmentofProfessor[index]}"),
                          khbox10,
                          SizedBox(
                            width: size.width * .33,
                            child: DropdownButtonFormField(
                              decoration: InputDecoration(
                              // helperStyle: TextStyle(fontSize: 10),
                                filled: true,
                                fillColor: Colors.grey[200],
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(1),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              style: TextStyle(fontSize: 11,color: Colors.black),
                              // key: _formKey,
                              value: selectedYearofProfessor,
                              elevation: 4,
                              items: yearsListofProfessor
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  _selectedYearofProfessor[index] = [value];
                                  print(_selectedYearofProfessor);
                                }
                                gettingValuesFromYear = _selectedYearofProfessor
                                    .where((list) => list.isNotEmpty)
                                    .map((list) => list[0])
                                    .toList();
                                print(gettingValuesFromYear);
                                // setState(() {
                                //   selectedYearofProfessor = value.toString();
                                // });
                              },
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: selectedepartmentcount,
                  ),
                ),

                InkWell(
                  onTap: () async {
                    onApplyButtonPressed();
                    checkTheLength();

                    // onApplyButtonPressed2();
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      AuthServices.signupUser(
                          email,
                          password,
                          fullname,
                          subname,
                          description,
                          gettingValues,
                          gettingValuesFromYear,
                          context);
                    }
                  },
                  child: Container(
                    width: size.width,
                    height: size.height * .05,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(115, 197, 186, 186),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
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

  void onApplyButtonPressed() {
    String? repeatedElement = findFirstRepeatedElement(gettingValues);
    if (gettingValues.isEmpty) {
      print('List is empty');
    } else if (repeatedElement == null) {
      print('No repeated element found');
    } else {
      print('repeated');
    }
  }

  String? findFirstRepeatedElement(List<String> checkingList) {
    Set<String> set = <String>{};
    for (int i = 0; i < checkingList.length; i++) {
      if (set.contains(checkingList[i])) {
        return checkingList[i];
      } else {
        set.add(checkingList[i]);
      }
    }
    return null; // If no repeated element is found, return null
  }

  checkTheLength() {
    if (gettingValues.length == gettingValuesFromYear.length) {
      print('The two lists have the same length');
    } else {
      print('The two lists have different lengths');
    }
  }
}
