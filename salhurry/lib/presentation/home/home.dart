import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:salhurry/presentation/constants/const.dart';
import 'package:salhurry/presentation/home/widgets/bottomtile.dart';
import 'package:salhurry/presentation/home/widgets/midbar.dart';
import 'package:salhurry/presentation/home/widgets/top.dart';
import 'package:salhurry/presentation/home/widgets/topapplied.dart';
import 'package:salhurry/presentation/home/widgets/topcompanieslist.dart';
import 'package:salhurry/presentation/home/widgets/topcompanyrow.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    const String hinttext = "Search";

    final CollectionReference topCompanies =
        FirebaseFirestore.instance.collection('topcompanies');

    final CollectionReference newJobs =
        FirebaseFirestore.instance.collection('newjobs');

    return Scaffold(
      body: SafeArea(
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetTopOFHome(height: height, width: width, hinttext: hinttext),
            const Divider(
              color: Color.fromARGB(11, 0, 0, 0),
              thickness: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //      WidgetCompleteProfile(width: width, height: height),
                  // const WidgetTopCompaniesRow(
                  //   leftportion: "Active List",
                  // ),
                  // khbox15,
                  // Container(
                  //   width: width * .38,
                  //   height: 180,
                  //   child: WidgetAppliedListTop(
                  //     width: width,
                  //     height: height,
                  //     title: "Graphic designer",
                  //     posted: '2hr',
                  //     loc: 'Kerala,India',
                  //     slots: "29",
                  //     rating: '3.9',
                  //   ),
                  // ),
                  SizedBox(height: height * .01),
                  const WidgetTopCompaniesRow(
                    leftportion: "Top companies",
                  ),
                  SizedBox(height: height * .02),
                  SizedBox(
                    width: double.infinity,
                    height: height * .23,
                    child: StreamBuilder(
                        stream: topCompanies.snapshots(),
                        builder: (context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            return ListView.separated(
                              itemCount: snapshot.data!.docs.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final DocumentSnapshot dptsnap =
                                    snapshot.data.docs[index];
                                String mnc = dptsnap['MNC'];
                                String title = dptsnap['title'];
                                String rating = dptsnap['rating'];
                                // String stddept = dptsnap['department'];
                                // String stdyr = dptsnap['year'];
                                return WidgetTopCompaniesTile(
                                    width: width,
                                    height: height,
                                    title: title,
                                    mnc: mnc,
                                    rating: rating);
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 20,
                                );
                              },
                            );
                          }
                          if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return Container();
                        }),
                  ),
                  SizedBox(height: height * .01),
                  const WidgetMidBar(),
                  SizedBox(height: height * .02),
                  Container(
                    width: double.infinity,
                    //    height: height,
                    //   color: const Color.fromARGB(39, 39, 12, 79),
                    child: 
                    StreamBuilder(
                      stream: newJobs.snapshots(),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return ListView.separated(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot dptsnap =
                                  snapshot.data.docs[index];
                              String title = dptsnap['title'];
                              String rating = dptsnap['rating'];
                              String t1 = dptsnap['t1'];
                              String t2 = dptsnap['t2'];
                              String t3 = dptsnap['t3'];
                              String posted = dptsnap['posted'];
                              String loc = dptsnap['loc'];
                              String slots = dptsnap['slots'];
                              //  String t1 = dptsnap['t1'];
                              final docID = dptsnap.id;

                              return WidgetBottomJobsTile(
                                width: width,
                                height: height,
                                title: title,
                                rating: rating,
                                t1: t1,
                                posted: posted,
                                loc: loc,
                                t2: t2,
                                t3: t3,
                                slots: slots,
                                documentSnapshots: docID,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 10,
                              );
                            },
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(child: SizedBox());
                        }
                        return Container();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
