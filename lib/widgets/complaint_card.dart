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
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: const Icon(Icons.report_problem),
        title: Text(complaint.title),
        subtitle: Text(complaint.description),
      ),
    );
  }
}