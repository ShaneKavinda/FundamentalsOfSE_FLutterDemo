import 'package:flutter/material.dart';

class EventRegistrationPage extends StatefulWidget {
  @override
  _EventRegistrationPageState createState() => _EventRegistrationPageState();
}

class _EventRegistrationPageState extends State<EventRegistrationPage> {
  String? selectedEvent;
  List<String> events = ['Event 1', 'Event 2', 'Event 3']; // Add your events here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Registration'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Label and Dropdown in the same row
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Select an Event:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  child: DropdownButton<String>(
                    value: selectedEvent,
                    items: events.map((String event) {
                      return DropdownMenuItem<String>(
                        value: event,
                        child: Text(event),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectedEvent = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement registration logic
                    // You can add any necessary logic before redirecting
                    Navigator.pushReplacementNamed(context, '/swimmer_landing');
                  },
                  child: Text('OK'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement cancellation logic
                    Navigator.pop(context); // Go back to the previous page
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
