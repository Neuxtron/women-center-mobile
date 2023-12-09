import 'package:intl/intl.dart';

class KarirModel {
  final int id;
  final String titleJob;
  final String logo;
  final String companyName;
  final String location;
  final DateTime publishedAt;

  KarirModel({
    required this.id,
    required this.titleJob,
    required this.logo,
    required this.companyName,
    required this.location,
    required this.publishedAt,
  });

  factory KarirModel.fromJson(Map<String, dynamic> json) {
    return KarirModel(
      id: json["id"],
      titleJob: json["title_job"],
      logo: json["logo"],
      companyName: json["company_name"],
      location: json["location"],
      publishedAt:
          DateFormat("dd MMM yyyy hh:mm:ss").parse(json["published_at"]),
    );
  }
}
