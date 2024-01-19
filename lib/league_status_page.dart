import 'package:flutter/material.dart';

class LeagueStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace the following with your actual data or logic to fetch club status
    ClubStatus clubStatus = ClubStatus(
      clubName: 'Awesome Club',
      expiryDate: DateTime(2024, 12, 31),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('League Status'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: _buildClubStatusCard(clubStatus),
            ),
            _buildRenewButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildClubStatusCard(ClubStatus clubStatus) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Club Name: ${clubStatus.clubName}',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15.0),
            Text(
              'Membership Expiry Date: ${clubStatus.expiryDate.day}/${clubStatus.expiryDate.month}/${clubStatus.expiryDate.year}',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 15.0),
            Text(
              'Days Left: ${calculateDaysLeft(clubStatus.expiryDate)}',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRenewButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Implement renew functionality
          // You can add any necessary logic here
        },
        child: Text('Renew Club Membership', style: TextStyle(fontSize: 20.0)),
      ),
    );
  }

  int calculateDaysLeft(DateTime expiryDate) {
    DateTime currentDate = DateTime.now();
    int daysLeft = expiryDate.difference(currentDate).inDays;
    return daysLeft;
  }
}

class ClubStatus {
  final String clubName;
  final DateTime expiryDate;

  ClubStatus({
    required this.clubName,
    required this.expiryDate,
  });
}
