class Farmer {
  final int id;
  final String name;
  final String phone;
  final String location;
  final List<String> crops;
  final String landArea;
  final String soilType;
  final String registrationDate;

  Farmer({
    required this.id,
    required this.name,
    required this.phone,
    required this.location,
    required this.crops,
    required this.landArea,
    required this.soilType,
    required this.registrationDate,
  });

  factory Farmer.fromJson(Map<String, dynamic> json) {
    return Farmer(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      location: json['location'] ?? '',
      crops: List<String>.from(json['crops'] ?? []),
      landArea: json['landArea'] ?? '',
      soilType: json['soilType'] ?? '',
      registrationDate: json['registrationDate'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'location': location,
      'crops': crops,
      'landArea': landArea,
      'soilType': soilType,
      'registrationDate': registrationDate,
    };
  }

  Farmer copyWith({
    int? id,
    String? name,
    String? phone,
    String? location,
    List<String>? crops,
    String? landArea,
    String? soilType,
    String? registrationDate,
  }) {
    return Farmer(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      crops: crops ?? this.crops,
      landArea: landArea ?? this.landArea,
      soilType: soilType ?? this.soilType,
      registrationDate: registrationDate ?? this.registrationDate,
    );
  }
}
