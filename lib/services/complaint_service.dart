import '../models/complaint_model.dart';

class ComplaintService {
  List<Complaint> getComplaints() {
    return [
      Complaint(
        title: 'Water Leakage',
        description: 'Pipe leaking near Gate A',
      ),
      Complaint(
        title: 'Street Light Not Working',
        description: 'Pole No. 12 is not functioning',
      ),
      Complaint(
        title: 'Garbage Collection Issue',
        description: 'Garbage not collected for 3 days',
      ),
    ];
  }
}