import 'package:flutter/material.dart';
import '../models/complaint_model.dart';
import '../widgets/complaint_card.dart';
import '../models/complaint_model.dart';
import '../services/complaint_service.dart';

class ComplaintListScreen extends StatelessWidget {
  const ComplaintListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final List<Complaint> complaints =
    ComplaintService().getComplaints();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaints'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: complaints.length,
        itemBuilder: (context, index) {
          return ComplaintCard(
  complaint: complaints[index],
);
        },
      ),
    );
  }
}