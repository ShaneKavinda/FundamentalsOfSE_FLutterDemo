import 'package:flutter/material.dart';
import 'upcoming_events_page.dart';
import 'event_registration_page.dart';
import 'past_results_page.dart';
import 'club_membership_page.dart';

class SwimmerLandingPage extends StatelessWidget {
  const SwimmerLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swimmer Landing Page'),
        automaticallyImplyLeading: false, // Remove the back button
        actions: [
          GestureDetector(
            onTap: () {
              // Implement sign-out functionality
              // You can add any necessary logic before redirecting
              Navigator.pushReplacementNamed(context, '/');
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Sign Out',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: [
          _buildTile(context, 'Upcoming Events', UpcomingEventsPage()),
          _buildTile(context, 'Register for Event', EventRegistrationPage()),
          _buildTile(context, 'Past Results', PastResultsPage()),
          _buildTile(context, 'Club Membership', ClubMembershipPage()),
        ],
      ),
    );
  }

  Widget _buildTile(BuildContext context, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        if (title == 'Register for Event') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EventRegistrationPage()),
          );
        }
        if (title == 'Past Results') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PastResultsPage()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
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
