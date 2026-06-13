import 'package:flutter/material.dart';
import '../models/complaint_model.dart';
import '../screens/complaint_details_screen.dart';

class ComplaintCard extends StatelessWidget {
  final Complaint complaint;
  final bool isFaculty;

  const ComplaintCard({
    super.key,
    required this.complaint,
    required this.isFaculty,
  });

  Color getStatusColor(String status) {
    switch (status) {
      case 'Resolved':
        return Colors.green;
      case 'In Progress':
        return Colors.blue;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ComplaintDetailsScreen(
                complaint: complaint,
                isFaculty: isFaculty,
              ),
            ),
          );
        },
        leading: const Icon(Icons.report_problem),
        title: Text(complaint.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(complaint.description),
            Text('ID: ${complaint.complaintId}'),
            Text('Category: ${complaint.category}'),
            Text('Type: ${complaint.complaintType}'),

            const SizedBox(height: 5),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: getStatusColor(
                  complaint.status,
                ).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                complaint.status,
                style: TextStyle(
                  color: getStatusColor(
                    complaint.status,
                  ),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}