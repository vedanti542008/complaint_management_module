import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/complaint_model.dart';

class ComplaintService {

  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  Future<void> addComplaint(
      Complaint complaint) async {

    await _firestore
        .collection('complaints')
        .doc(complaint.complaintId)
        .set({
      'complaintId': complaint.complaintId,
      'title': complaint.title,
      'description': complaint.description,
      'category': complaint.category,
      'complaintType': complaint.complaintType,
      'status': complaint.status,
      'createdAt':
          complaint.createdAt.toIso8601String(),
    });
  }

  Future<List<Complaint>> getComplaints() async {

  final snapshot =
      await _firestore.collection('complaints').get();

  for (var doc in snapshot.docs) {
    print(doc.data());
  }

  return snapshot.docs.map((doc) {
    return Complaint.fromMap(doc.data());
  }).toList();
}
}