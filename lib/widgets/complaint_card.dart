import 'package:flutter/material.dart';
import '../models/complaint_model.dart';

class ComplaintCard extends StatelessWidget {
  final Complaint complaint;

  const ComplaintCard({
    super.key,
    required this.complaint,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: ListTile(
  leading: const Icon(Icons.report_problem),
  title: Text(complaint.title),
  subtitle: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(complaint.description),
      Text('ID: ${complaint.complaintId}'),
      Text('Category: ${complaint.category}'),
      Text('Type: ${complaint.complaintType}'),
      Text('Status: ${complaint.status}'),
    ],
  ),
),
    );
  }
}