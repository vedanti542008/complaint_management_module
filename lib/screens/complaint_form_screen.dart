import 'package:flutter/material.dart';

class ComplaintFormScreen extends StatelessWidget {
  const ComplaintFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Complaint'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Complaint Title',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Complaint Description',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
               onPressed: () {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Complaint Submitted Successfully!'),
    ),
  );
},
                child: const Text('Submit Complaint'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}