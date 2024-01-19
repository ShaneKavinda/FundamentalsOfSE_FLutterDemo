// TODO Implement this library.
import 'package:flutter/material.dart';

class SwimMeetSchedulesPage extends StatefulWidget {
  @override
  _SwimMeetSchedulesPageState createState() => _SwimMeetSchedulesPageState();
}

class _SwimMeetSchedulesPageState extends State<SwimMeetSchedulesPage> {
  // Replace this with your actual data or logic to fetch swim meet schedules
  List<Event> swimMeetSchedules = [
    Event('Event 1', 'Age Group 1', 'Club A, Club B', DateTime(2024, 7, 15)),
    Event('Event 2', 'Age Group 2', 'Club C, Club D', DateTime(2024, 2, 20)),
    // Add more events as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swim Meet Schedules'),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: _buildCalendar(swimMeetSchedules),
          ),
          Expanded(
            flex: 3,
            child: _buildNewEventForm(),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendar(List<Event> events) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(events[index].eventName),
              subtitle: Text(
                'Date: ${events[index].eventDate.day}/${events[index].eventDate.month}/${events[index].eventDate.year}',
              ),
              // Add more details as needed
            ),
          );
        },
      ),
    );
  }

  Widget _buildNewEventForm() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create New Event',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(labelText: 'Event Name'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Age Group'),
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Qualified Clubs'),
          ),
          SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              // Implement functionality to create a new event
            },
            child: Text('Create Event'),
          ),
        ],
      ),
    );
  }
}

class Event {
  final String eventName;
  final String ageGroup;
  final String qualifiedClubs;
  final DateTime eventDate;

  Event(this.eventName, this.ageGroup, this.qualifiedClubs, this.eventDate);
}
