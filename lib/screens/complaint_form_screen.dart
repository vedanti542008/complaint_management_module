import 'package:flutter/material.dart';
import '../models/complaint_model.dart';
import '../services/complaint_service.dart';

class ComplaintFormScreen extends StatefulWidget {
  const ComplaintFormScreen({super.key});

  @override
  State<ComplaintFormScreen> createState() =>
      _ComplaintFormScreenState();
}

class _ComplaintFormScreenState
    extends State<ComplaintFormScreen> {

  String selectedCategory = 'Infrastructure';
  String selectedType = 'Individual';

final TextEditingController titleController =
      TextEditingController();

  final TextEditingController descriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Complaint'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Complaint Title',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
                controller: descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                labelText: 'Complaint Description',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
              ),
              items: const [
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

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              value: selectedType,
              decoration: const InputDecoration(
                labelText: 'Complaint Type',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Individual',
                  child: Text('Individual'),
                ),
                DropdownMenuItem(
                  value: 'Group',
                  child: Text('Group'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedType = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            SizedBox(
  width: double.infinity,
  child: ElevatedButton(
    onPressed: () async {

  String title = titleController.text.trim();
  String description = descriptionController.text.trim();

  if (title.isEmpty || description.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please fill all fields'),
      ),
    );
    return;
  }

  final complaint = Complaint(
  complaintId: DateTime.now().millisecondsSinceEpoch.toString(),
  title: title,
  description: description,
  category: selectedCategory,
  complaintType: selectedType,
  status: 'Pending',
  createdAt: DateTime.now(),
  userId: '',
);

  await ComplaintService()
    .addComplaint(complaint);

  titleController.clear();
  descriptionController.clear();

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text(
        'Complaint Submitted Successfully!',
      ),
    ),
  );
},
    child: const Text('Submit Complaint'),
  ),
),
          ],
        ),
      ),
    );
  }
}