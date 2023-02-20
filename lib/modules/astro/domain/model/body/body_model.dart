class BodyModel {
  BodyModel({
    required this.latitude,
    required this.longitude,
    required this.fromDate,
    required this.toDate,
    required this.time,
    required this.elevation,
  });

  final double latitude;
  final double longitude;
  final String fromDate;
  final String toDate;
  final String time;
  final double elevation;
}
