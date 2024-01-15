import 'package:flutter/material.dart';

class ClubOfficialLandingPage extends StatelessWidget {
  const ClubOfficialLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Club Official Landing Page'),
      ),
      body: const Center(
        child: Text('Welcome, Club Official!'),
      ),
    );
  }
}
