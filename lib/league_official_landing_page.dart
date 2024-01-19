import 'package:flutter/material.dart';
import 'swim_meet_schedules_page.dart';
import 'edit_events_page.dart';

class LeagueOfficialLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('League Official Landing Page'),
        actions: [
          GestureDetector(
            onTap: () {
              // Implement sign-out functionality
              Navigator.pushReplacementNamed(context, '/');
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Sign Out',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          _buildTile(context, 'Swim Meet Schedules', SwimMeetSchedulesPage()),
          _buildTile(context, 'Edit Events',EditEventsPage()),
        ],
      ),
    );
  }

  Widget _buildTile(BuildContext context, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Card(
        elevation: 5.0,
        margin: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
