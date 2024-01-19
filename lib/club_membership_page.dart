import 'package:flutter/material.dart';

class ClubMembershipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Club Membership'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _buildClubList(context),
          ),
          _buildApplyMembershipButton(context),
        ],
      ),
    );
  }

  Widget _buildClubList(BuildContext context) {
    // Replace with actual data or logic to fetch available clubs
    List<String> clubs = ['Club A', 'Club B', 'Club C', 'Club D', 'Club E'];

    return ListView.builder(
      itemCount: clubs.length,
      itemBuilder: (context, index) {
        return _buildClubTile(clubs[index], context);
      },
    );
  }

  Widget _buildClubTile(String clubName, BuildContext context) {
    double textSize = MediaQuery.of(context).size.width > 600 ? 24.0 : 18.0;

    return Card(
      margin: EdgeInsets.all(10.0),
      elevation: 5.0,
      child: ListTile(
        title: Text(
          clubName,
          style: TextStyle(fontSize: textSize, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          // Implement logic when a club is tapped
          // For example, navigate to a detailed club page
        },
      ),
    );
  }

  Widget _buildApplyMembershipButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Implement logic when "Apply Membership" button is pressed
          // For example, navigate to a membership application page
        },
        child: Text('Apply Membership'),
      ),
    );
  }
}
