import 'package:admin_portal01/presentation/constants/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
class JustOkScreen extends StatefulWidget {
  const JustOkScreen({super.key});
  @override
  State<JustOkScreen> createState() => _JustOkScreenState();
}
class _JustOkScreenState extends State<JustOkScreen> {
 final List<int> departmentcount = [1, 2, 3, 4, 5, 6];
  int? selectedepartmentcount = 1;
  var selectedYearofProfessor = '2nd';
  final departmentListofProfessor = ['CSE', 'CIVIL', 'MECH', 'EC', 'EI', 'EEE'];
  String selectedDepartmentofProfessor = 'CSE';
  final List<List<String>> _selectedDepartmentofProfessor = [];
    List<String> gettingValues = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 6; i++) {
      _selectedDepartmentofProfessor.add([]);
    }
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
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
                      // print(selectedepartmentcount);

                      setState(() {
                        selectedepartmentcount = value;
                      });
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
                        },
                      );
      },
                    itemCount: selectedepartmentcount,
                  ),
  ),
          ],
        ),
      ),
    );
  }
}
