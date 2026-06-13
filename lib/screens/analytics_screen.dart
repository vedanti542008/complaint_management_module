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
            child: SingleChildScrollView(
  child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
               children: [

  Card(
color: Colors.purple.shade100,
    child: ListTile(
      leading: const Icon(Icons.list_alt),
      title: const Text('Total Complaints'),
      trailing: Text(
        '$total',
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),

  Card(
    color: Colors.orange.shade100,
    child: ListTile(
      leading: const Icon(Icons.pending_actions),
      title: const Text('Pending'),
      trailing: Text(
        '$pending',
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),

  Card(
color: Colors.blue.shade100,
    child: ListTile(
      leading: const Icon(Icons.autorenew),
      title: const Text('In Progress'),
      trailing: Text(
        '$inProgress',
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),

  Card(
    color: Colors.green.shade100,
    child: ListTile(
      leading: const Icon(Icons.check_circle),
      title: const Text('Resolved'),
      trailing: Text(
        '$resolved',
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),

  const SizedBox(height: 30),

  const Text(
    'Category Breakdown',
    style: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  ),

  const SizedBox(height: 10),

  Card(
    child: ListTile(
      title: const Text('Infrastructure'),
      trailing: Text('$infrastructure'),
    ),
  ),

  Card(
    child: ListTile(
      title: const Text('Academic'),
      trailing: Text('$academic'),
    ),
  ),

  Card(
    child: ListTile(
      title: const Text('Hostel'),
      trailing: Text('$hostel'),
    ),
  ),

  Card(
    child: ListTile(
      title: const Text('Canteen'),
      trailing: Text('$canteen'),
    ),
  ),

  Card(
    child: ListTile(
      title: const Text('Transport'),
      trailing: Text('$transport'),
    ),
  ),

  Card(
    child: ListTile(
      title: const Text('Other'),
      trailing: Text('$other'),
    ),
  ),
],
            ),
            ),
          );
        },
      ),
    );
  }
}