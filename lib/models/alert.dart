class Alert {
  final int id;
  final String type;
  final String message;
  final String priority;
  final String date;

  Alert({
    required this.id,
    required this.type,
    required this.message,
    required this.priority,
    required this.date,
  });

  factory Alert.fromJson(Map<String, dynamic> json) {
    return Alert(
      id: json['id'] ?? 0,
      type: json['type'] ?? '',
      message: json['message'] ?? '',
      priority: json['priority'] ?? 'medium',
      date: json['date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'message': message,
      'priority': priority,
      'date': date,
    };
  }
}

class SchemeInfo {
  final String name;
  final String description;
  final String eligibility;
  final String deadline;
  final String contact;

  SchemeInfo({
    required this.name,
    required this.description,
    required this.eligibility,
    required this.deadline,
    required this.contact,
  });

  factory SchemeInfo.fromJson(Map<String, dynamic> json) {
    return SchemeInfo(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      eligibility: json['eligibility'] ?? '',
      deadline: json['deadline'] ?? '',
      contact: json['contact'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'eligibility': eligibility,
      'deadline': deadline,
      'contact': contact,
    };
  }
}

class PestDiseaseInfo {
  final String name;
  final String crop;
  final String symptoms;
  final String treatment;
  final String prevention;

  PestDiseaseInfo({
    required this.name,
    required this.crop,
    required this.symptoms,
    required this.treatment,
    required this.prevention,
  });

  factory PestDiseaseInfo.fromJson(Map<String, dynamic> json) {
    return PestDiseaseInfo(
      name: json['name'] ?? '',
      crop: json['crop'] ?? '',
      symptoms: json['symptoms'] ?? '',
      treatment: json['treatment'] ?? '',
      prevention: json['prevention'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'crop': crop,
      'symptoms': symptoms,
      'treatment': treatment,
      'prevention': prevention,
    };
  }
}
