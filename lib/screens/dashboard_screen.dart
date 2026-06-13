import 'package:flutter/material.dart';
import 'complaint_form_screen.dart';
import 'complaint_list_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Padding(
  padding: const EdgeInsets.all(20),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const Text(
        'Complaint Dashboard',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),

      const SizedBox(height: 30),

      ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ComplaintFormScreen(),
      ),
    );
  },
  child: const Text('Register Complaint'),
),

      const SizedBox(height: 15),

      ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ComplaintListScreen(
          isFaculty: false,
        ),
      ),
    );
  },
  child: const Text('View Complaints'),
),

      const SizedBox(height: 15),

      ElevatedButton(
        onPressed: () {},
        child: const Text('Profile'),
      ),
    ],
  ),
),
    );
  }
}