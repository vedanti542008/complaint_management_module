class Complaint {
  final String complaintId;
  final String title;
  final String description;
  final String category;
  final String complaintType;
  final String status;
  final DateTime createdAt;
  final String userId;

  Complaint({
    required this.complaintId,
    required this.title,
    required this.description,
    required this.category,
    required this.complaintType,
    required this.status,
    required this.createdAt,
    required this.userId,
  });

  factory Complaint.fromMap(Map<String, dynamic> map) {
  return Complaint(
  complaintId: map['complaintId'] ?? '',
  title: map['title'] ?? '',
  description: map['description'] ?? '',
  category: map['category'] ?? '',
  complaintType: map['complaintType'] ?? '',
  status: map['status'] ?? '',
  createdAt: DateTime.parse(map['createdAt']),
  userId: map['userId'] ?? '',
);
}
}