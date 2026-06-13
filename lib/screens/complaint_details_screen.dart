import 'package:flutter/material.dart';
import '../models/complaint_model.dart';

class ComplaintDetailsScreen extends StatelessWidget {
  final Complaint complaint;

  const ComplaintDetailsScreen({
    super.key,
    required this.complaint,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaint Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              complaint.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Text('ID: ${complaint.complaintId}'),
            const SizedBox(height: 10),

            Text('Description: ${complaint.description}'),
            const SizedBox(height: 10),

            Text('Category: ${complaint.category}'),
            const SizedBox(height: 10),

            Text('Type: ${complaint.complaintType}'),
            const SizedBox(height: 10),

            Text('Status: ${complaint.status}'),
            const SizedBox(height: 10),

            Text(
              'Created At: ${complaint.createdAt}',
            ),
          ],
        ),
      ),
    );
  }
}