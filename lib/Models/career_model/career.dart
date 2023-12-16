class Job {
  final int id;
  final String title;
  final String logo;
  final String companyName;
  final String publishedAt;
  final String location;

  Job({
    required this.id,
    required this.title,
    required this.logo,
    required this.companyName,
    required this.publishedAt,
    required this.location,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      title: json['title_job'],
      logo: json['logo'],
      companyName: json['company_name'],
      publishedAt: json['published_at'],
      location: json['location'],
    );
  }
}
