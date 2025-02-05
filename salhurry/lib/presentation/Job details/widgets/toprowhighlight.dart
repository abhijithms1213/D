import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetHighlightRow extends StatelessWidget {
  const WidgetHighlightRow({
    super.key,
    required this.width,
    required this.height,
    required this.documentSnapshot,
  });

  final double width;
  final double height;
  final String documentSnapshot;
  @override
  Widget build(BuildContext context) {
    final CollectionReference highlights = FirebaseFirestore.instance
        .collection('newjobs')
        .doc(documentSnapshot)
        .collection('higlights');
    return StreamBuilder<QuerySnapshot>(
      stream: highlights.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: TextStyle(color: Colors.black),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return 
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: List.generate(
            snapshot.data!.docs.length,
            (index) {
              final DocumentSnapshot dptsnap = snapshot.data!.docs[index];
              String h = dptsnap['h'];
              return Container(
                width: width * 0.3,
                height: height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: const Color.fromARGB(16, 0, 0, 0), width: 2),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: height * 0.07,
                      width: width * 0.1,
                      child: const Icon(Icons.badge),
                    ),
                    Expanded(
                      child: Text(
                        h,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
