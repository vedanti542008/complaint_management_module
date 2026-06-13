import 'package:flutter/material.dart';
import '../models/complaint_model.dart';
import '../widgets/complaint_card.dart';
import '../services/complaint_service.dart';

class ComplaintListScreen extends StatelessWidget {
  final bool showOnlyMyComplaints;
  final bool isFaculty;

  const ComplaintListScreen({
    super.key,
    this.showOnlyMyComplaints = false,
    required this.isFaculty,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaints'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Complaint>>(
        future: showOnlyMyComplaints
            ? ComplaintService().getMyComplaints()
            : ComplaintService().getComplaints(),
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
              ),
            );
          }

          final complaints = snapshot.data ?? [];

          if (complaints.isEmpty) {
            return const Center(
              child: Text('No complaints found'),
            );
          }

          return ListView.builder(
            itemCount: complaints.length,
            itemBuilder: (context, index) {
              return ComplaintCard(
                complaint: complaints[index],
                isFaculty: isFaculty,
              );
            },
          );
        },
      ),
    );
  }
}