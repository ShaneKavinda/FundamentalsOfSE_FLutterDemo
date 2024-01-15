import 'package:flutter/material.dart';

class UpcomingEventsPage extends StatelessWidget {
  // Sample list of events (you can replace it with your actual data)
  final List<Event> events = [
    Event(
      eventName: 'Inter School Competition',
      eventDate: 'January 15, 2024',
      eventImage:
          'assets/images/swimming_competition.jpg', // Replace with actual image path
    ),
    Event(
      eventName: 'Under 13 Comp',
      eventDate: 'February 22, 2024',
      eventImage:
          'assets/images/under_13.jpg', // Replace with actual image path
    ),
    // Add more events as needed
  ];

  UpcomingEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Events'),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return _buildEventCard(events[index]);
        },
      ),
    );
  }

  Widget _buildEventCard(Event event) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(event.eventImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.eventName,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Date: ${event.eventDate}',
                  style: const TextStyle(fontSize: 16.0),
                ),
                // Add more details as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Event {
  final String eventName;
  final String eventDate;
  final String eventImage;

  Event({
    required this.eventName,
    required this.eventDate,
    required this.eventImage,
  });
}
