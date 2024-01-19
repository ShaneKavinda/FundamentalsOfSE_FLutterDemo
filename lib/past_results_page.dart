import 'package:flutter/material.dart';

class PastResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Past Results'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildPastResultsCards(),
            _buildSearchSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildPastResultsCards() {
    // Replace with actual data or logic to fetch past results
    List<PastEventResult> pastResults = [
      PastEventResult(
        eventName: 'Event 1',
        eventDate: '2022-01-01',
        winner: 'Swimmer A',
        thumbnailUrl: 'assets/images/event_thumbnail1.jpg', // Replace with actual image path
      ),
      PastEventResult(
        eventName: 'Event 2',
        eventDate: '2022-02-01',
        winner: 'Swimmer B',
        thumbnailUrl: 'assets/images/event_thumbnail2.jpg', // Replace with actual image path
      ),
      // Add more past results as needed
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: pastResults.map((result) {
        return _buildResultCard(result);
      }).toList(),
    );
  }

  Widget _buildResultCard(PastEventResult result) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      elevation: 5.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            result.thumbnailUrl,
            height: 150.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  result.eventName,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text('Date: ${result.eventDate}'),
                Text('Winner: ${result.winner}'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchSection(BuildContext context) {
    DateTime selectedDate;

    return Column(
      children: [
        SizedBox(height: 16.0),
        Text(
          'Search Past Results',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        TextField(
          decoration: InputDecoration(
            hintText: 'Enter Swimmer or Event Name',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 8.0),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Implement search functionality
                },
                child: Text('Search'),
              ),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  // Show date picker and update selectedDate
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );

                  if (pickedDate != null ) {
                    selectedDate = pickedDate;
                    // Perform any logic with the selected date
                  }
                },
                child: Text('Choose Date'),
              ),
            ),
          ],
        ),
        // Additional widgets for displaying search results
      ],
    );
  }
}

class PastEventResult {
  final String eventName;
  final String eventDate;
  final String winner;
  final String thumbnailUrl;

  PastEventResult({
    required this.eventName,
    required this.eventDate,
    required this.winner,
    required this.thumbnailUrl,
  });
}
