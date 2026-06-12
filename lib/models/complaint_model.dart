class Complaint {
  final String complaintId;
  final String title;
  final String description;
  final String category;
  final String complaintType;
  final String status;
  final DateTime createdAt;

  Complaint({
    required this.complaintId,
    required this.title,
    required this.description,
    required this.category,
    required this.complaintType,
    required this.status,
    required this.createdAt,
  });

  factory Complaint.fromMap(Map<String, dynamic> map) {
  return Complaint(
    complaintId: map['complaintId']?.toString() ?? '',
    title: map['title']?.toString() ?? '',
    description: map['description']?.toString() ?? '',
    category: map['category']?.toString() ?? '',
    complaintType: map['complaintType']?.toString() ?? '',
    status: map['status']?.toString() ?? '',
    createdAt: DateTime.tryParse(
          map['createdAt']?.toString() ?? '',
        ) ??
        DateTime.now(),
  );
}
}