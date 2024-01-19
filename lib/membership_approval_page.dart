import 'package:flutter/material.dart';

class MembershipApprovalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace the following with your actual data or logic to fetch member requests
    List<MemberRequest> memberRequests = [
      MemberRequest('John Doe', DateTime(1990, 5, 15)),
      MemberRequest('Jane Smith', DateTime(1985, 8, 22)),
      // Add more member requests as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Membership Approval'),
      ),
      body: ListView.builder(
        itemCount: memberRequests.length,
        itemBuilder: (context, index) {
          return _buildMemberRequestTile(context, memberRequests[index]);
        },
      ),
    );
  }

  Widget _buildMemberRequestTile(BuildContext context, MemberRequest memberRequest) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(memberRequest.name),
        subtitle: Text(
          'Birthday: ${memberRequest.birthday.day}/${memberRequest.birthday.month}/${memberRequest.birthday.year} - Age: ${calculateAge(memberRequest.birthday)}',
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                // Implement approve functionality
                // You can add any necessary logic here
              },
              child: Text('Approve'),
            ),
            SizedBox(width: 8.0),
            ElevatedButton(
              onPressed: () {
                // Implement decline functionality
                // You can add any necessary logic here
              },
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: Text('Decline'),
            ),
          ],
        ),
      ),
    );
  }

  int calculateAge(DateTime birthday) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthday.year;

    if (currentDate.month < birthday.month ||
        (currentDate.month == birthday.month && currentDate.day < birthday.day)) {
      age--;
    }

    return age;
  }
}

class MemberRequest {
  final String name;
  final DateTime birthday;

  MemberRequest(this.name, this.birthday);
}
