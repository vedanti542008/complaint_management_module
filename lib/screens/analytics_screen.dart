import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('complaints')
            .get(),
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

          final complaints = snapshot.data!.docs;

          int total = complaints.length;

          int pending = complaints.where((doc) {
            return doc['status'] == 'Pending';
          }).length;

          int inProgress = complaints.where((doc) {
            return doc['status'] == 'In Progress';
          }).length;

          int resolved = complaints.where((doc) {
            return doc['status'] == 'Resolved';
          }).length;

          int infrastructure = complaints.where((doc) {
  return doc['category'] == 'Infrastructure';
}).length;

int academic = complaints.where((doc) {
  return doc['category'] == 'Academic';
}).length;

int hostel = complaints.where((doc) {
  return doc['category'] == 'Hostel';
}).length;

int canteen = complaints.where((doc) {
  return doc['category'] == 'Canteen';
}).length;

int transport = complaints.where((doc) {
  return doc['category'] == 'Transport';
}).length;

int other = complaints.where((doc) {
  return doc['category'] == 'Other';
}).length;

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Complaints: $total',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  'Pending: $pending',
                  style: const TextStyle(fontSize: 18),
                ),

                Text(
                  'In Progress: $inProgress',
                  style: const TextStyle(fontSize: 18),
                ),

                Text(
                  'Resolved: $resolved',
                  style: const TextStyle(fontSize: 18),
                ),

                const SizedBox(height: 30),

const Text(
  'Category Breakdown',
  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
),

const SizedBox(height: 10),

Text('Infrastructure: $infrastructure'),
Text('Academic: $academic'),
Text('Hostel: $hostel'),
Text('Canteen: $canteen'),
Text('Transport: $transport'),
Text('Other: $other'),
              ],
            ),
          );
        },
      ),
    );
  }
}