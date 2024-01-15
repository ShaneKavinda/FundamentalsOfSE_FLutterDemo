import 'package:flutter/material.dart';
import 'upcoming_events_page.dart';
import 'register_for_event_page.dart';
import 'past_results_page.dart';
import 'club_membership_page.dart';

class SwimmerLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swimmer Landing Page'),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: [
          _buildTile(context, 'Upcoming Events', UpcomingEventsPage()),
          _buildTile(context, 'Register for Event', RegisterForEventPage()),
          _buildTile(context, 'Past Results', PastResultsPage()),
          _buildTile(context, 'Club Membership', ClubMembershipPage()),
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
        margin: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
