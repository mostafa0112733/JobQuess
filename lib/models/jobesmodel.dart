class Job {
  final String name;
  final String jobType;
  final String image;
  final String jobTimeType;
  final String jobDescription;
  final String jobSkill;
  final String aboutCompany;
  final String salary;
  final String compEmail;
  final String id;
  final String compWebsite;

  Job({
    required this.name,
    required this.jobType,
    required this.image,
    required this.jobTimeType,
    required this.jobDescription,
    required this.jobSkill,
    required this.aboutCompany,
    required this.salary,
    required this.compEmail,
    required this.id,
    required this.compWebsite,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      name: json['name'] ?? 'Unknown Job',
      jobType: json['job_type'] ?? 'No description available',
      image: json['image'] ?? 'Unknown',
      jobTimeType: json['job_time_type'] ?? 'Unknown',
      jobDescription: json['job_description'] ?? 'Unknown',
      jobSkill: json['job_skill'] ?? 'Unknown',
      aboutCompany: json['about_comp'] ?? 'Unknown',
      salary: json['salary'] ?? 'Unknown',
      compEmail: json['comp_email'] ?? 'Unknown',
      id: json['id'].toString(),
      compWebsite: json['comp_website'] ?? 'Unknown',
    );
  }
}
