// lib/data/models/consumption.dart

class CigaretteConsumption {
  final DateTime dateTime;

  CigaretteConsumption({required this.dateTime});

  Map<String, dynamic> toJson() {
    return {'dateTime': dateTime.toIso8601String()};
  }

  factory CigaretteConsumption.fromJson(Map<String, dynamic> json) {
    return CigaretteConsumption(dateTime: DateTime.parse(json['dateTime']));
  }
}
