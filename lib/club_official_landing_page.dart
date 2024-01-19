import 'package:flutter/material.dart';
import 'membership_approval_page.dart';
import 'league_status_page.dart';

class ClubOfficialHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Club Official Home Page'),
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
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildWelcomeMessage(),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _buildTile(
                    context,
                    'Membership Approval',
                    MembershipApprovalPage(),
                  ),
                ),
                Expanded(
                  child: _buildTile(
                    context,
                    'League Status',
                    LeagueStatusPage(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeMessage() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Welcome, Club Official!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
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
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
