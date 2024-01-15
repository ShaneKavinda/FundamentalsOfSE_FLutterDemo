import 'package:flutter/material.dart';

class PastResultsPage extends StatelessWidget {
  const PastResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Past Results'),
      ),
      body: const Center(
        child: Text('Past Results Page'),
      ),
    );
  }
}
