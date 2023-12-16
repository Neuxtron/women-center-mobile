class JobDetail {
  final String titleJob;
  final String logo;
  final String publishedAt;
  final String companyName;
  final String cover;
  final String linkedinUrl;
  final String location;
  final String aboutJob;
  final String aboutCompany;
  final String requiredSkill;
  final String companyIndustry;
  final int sizeCompanyEmployee;
  // final List<Map<String, dynamic>> jobType;
  final String createdAt;
  final String updatedAt;

  JobDetail({
    required this.titleJob,
    required this.logo,
    required this.companyName,
    required this.publishedAt,
    required this.cover,
    required this.linkedinUrl,
    required this.location,
    required this.aboutJob,
    required this.aboutCompany,
    required this.requiredSkill,
    required this.companyIndustry,
    required this.sizeCompanyEmployee,
    // required this.jobType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory JobDetail.fromJson(Map<String, dynamic> json) {
    return JobDetail(
      titleJob: json['title_job'],
      logo: json['logo'],
      companyName: json['company_name'],
      publishedAt: json['published_at'],
      cover: json['cover'],
      linkedinUrl: json['linkedin_url'],
      location: json['location'],
      aboutJob: json['about_job'],
      aboutCompany: json['about_company'],
      requiredSkill: json['required_skill'],
      companyIndustry: json['company_industry'],
      sizeCompanyEmployee: json['size_company_employee'],
      // jobType: List<Map<String, dynamic>>.from(json['job_type']),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
