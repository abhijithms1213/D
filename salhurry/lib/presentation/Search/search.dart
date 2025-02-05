import 'package:flutter/material.dart';

class JobListingScreen extends StatefulWidget {
  @override
  _JobListingScreenState createState() => _JobListingScreenState();
}

class _JobListingScreenState extends State<JobListingScreen> {
  String selectedPlace = 'TVM'; // Default selected place

  Map<String, List<String>> jobsByPlace = {
    'TVM': ['Job 1 in TVM', 'Job 2 in TVM', 'Job 3 in TVM'],
    'Kochi': ['Job 1 in Kochi', 'Job 2 in Kochi', 'Job 3 in Kochi'],
    'Kollam': ['Job 1 in Kollam', 'Job 2 in Kollam', 'Job 3 in Kollam'],
    'TKM': ['Job 1 in TKM', 'Job 2 in TKM', 'Job 3 in TKM'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Listings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: DropdownButton<String>(
                value: selectedPlace,
                onChanged: (newValue) {
                  setState(() {
                    selectedPlace = newValue!;
                  });
                },
                items: ['TVM', 'Kochi', 'Kollam', 'TKM']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: jobsByPlace[selectedPlace]!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(jobsByPlace[selectedPlace]![index]),
                    onTap: () {
                      // Handle job selection
                      print('Selected job: ${jobsByPlace[selectedPlace]![index]}');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
