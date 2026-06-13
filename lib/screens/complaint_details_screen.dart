import 'package:flutter/material.dart';
import '../models/complaint_model.dart';
import '../services/complaint_service.dart';

class ComplaintDetailsScreen extends StatelessWidget {
  final Complaint complaint;
  final bool isFaculty;

  const ComplaintDetailsScreen({
    super.key,
    required this.complaint,
    required this.isFaculty,
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

            if (isFaculty)
          DropdownButton<String>(
            value: complaint.status,
            items: const [
              DropdownMenuItem(
                value: 'Pending',
                child: Text('Pending'),
              ),
              DropdownMenuItem(
                value: 'In Progress',
                child: Text('In Progress'),
              ),
              DropdownMenuItem(
                value: 'Resolved',
                child: Text('Resolved'),
              ),
            ],
            onChanged: (value) async {
              await ComplaintService()
                  .updateComplaintStatus(
                complaint.complaintId,
                value!,
              );

              if (context.mounted) {
                Navigator.pop(context);
              }
            },
          ),
            const SizedBox(height: 10),
if (isFaculty)
  ElevatedButton.icon(
    icon: const Icon(Icons.delete),
    label: const Text('Delete Complaint'),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
      foregroundColor: Colors.white,
    ),
    onPressed: () async {
      bool? confirm = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Delete Complaint'),
            content: const Text(
              'Are you sure you want to delete this complaint?',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text('Delete'),
              ),
            ],
          );
        },
      );

      if (confirm == true) {
        await ComplaintService().deleteComplaint(
          complaint.complaintId,
        );

        if (context.mounted) {
          Navigator.pop(context);
        }
      }
    },
  ),
         Text(
              'Created At: ${complaint.createdAt}',
            ),
          ],
        ),
      ),
    );
  }
}