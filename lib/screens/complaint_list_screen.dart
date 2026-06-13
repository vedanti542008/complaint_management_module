import 'package:flutter/material.dart';
import '../models/complaint_model.dart';
import '../widgets/complaint_card.dart';
import '../services/complaint_service.dart';

class ComplaintListScreen extends StatefulWidget {
  final bool showOnlyMyComplaints;
  final bool isFaculty;

  const ComplaintListScreen({
    super.key,
    this.showOnlyMyComplaints = false,
    required this.isFaculty,
    
  });

  @override
  State<ComplaintListScreen> createState() => _ComplaintListScreenState();
}

class _ComplaintListScreenState extends State<ComplaintListScreen> {
final TextEditingController searchController =
    TextEditingController();

String searchQuery = '';
String selectedStatus = 'All';
String selectedCategory = 'All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaints'),
        centerTitle: true,
      ),
body: Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: searchController,
        decoration: const InputDecoration(
          hintText: 'Search by title or ID',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          setState(() {
            searchQuery = value.toLowerCase();
          });
        },
      ),
    ),
    Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 10,
  ),
  child: DropdownButtonFormField<String>(
    value: selectedStatus,
    decoration: const InputDecoration(
      labelText: 'Filter by Status',
      border: OutlineInputBorder(),
    ),
    items: const [
      DropdownMenuItem(
        value: 'All',
        child: Text('All'),
      ),
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
    onChanged: (value) {
      setState(() {
        selectedStatus = value!;
      });
    },
  ),
),
Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 10,
  ),
  child: DropdownButtonFormField<String>(
    value: selectedCategory,
    decoration: const InputDecoration(
      labelText: 'Filter by Category',
      border: OutlineInputBorder(),
    ),
    items: const [
      DropdownMenuItem(
        value: 'All',
        child: Text('All'),
      ),
      DropdownMenuItem(
        value: 'Infrastructure',
        child: Text('Infrastructure'),
      ),
      DropdownMenuItem(
        value: 'Academic',
        child: Text('Academic'),
      ),
      DropdownMenuItem(
        value: 'Hostel',
        child: Text('Hostel'),
      ),
      DropdownMenuItem(
        value: 'Canteen',
        child: Text('Canteen'),
      ),
      DropdownMenuItem(
        value: 'Transport',
        child: Text('Transport'),
      ),
      DropdownMenuItem(
        value: 'Other',
        child: Text('Other'),
      ),
    ],
    onChanged: (value) {
      setState(() {
        selectedCategory = value!;
      });
    },
  ),
),

    Expanded(
      child: FutureBuilder<List<Complaint>>(        future: widget.showOnlyMyComplaints
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
                      final filteredComplaints =
                complaints.where((complaint) {

              bool matchesSearch =
                  complaint.title
                          .toLowerCase()
                          .contains(searchQuery) ||
                  complaint.complaintId
                          .toLowerCase()
                          .contains(searchQuery);

              bool matchesStatus =
                  selectedStatus == 'All' ||
                  complaint.status == selectedStatus;

              bool matchesCategory =
                  selectedCategory == 'All' ||
                  complaint.category == selectedCategory;

              return matchesSearch && matchesStatus && matchesCategory;

            }).toList();

                      if (filteredComplaints.isEmpty) {
              return const Center(
                child: Text('No complaints found'),
              );
            }

                      return ListView.builder(
            itemCount: filteredComplaints.length,            itemBuilder: (context, index) {
                          return ComplaintCard(
                            complaint: filteredComplaints[index],
                            isFaculty: widget.isFaculty,
              );
            },
          );
        },
      ),
    ),
  ],
),
  );
  }
}