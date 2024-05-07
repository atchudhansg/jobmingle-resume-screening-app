import 'package:hive/hive.dart';

part 'job_post.g.dart';

@HiveType(typeId: 0)
class JobPost {
  @HiveField(0)
  late String jobTitle;

  @HiveField(1)
  late String jobDescription;

  @HiveField(2)
  late String recruiterEmail;

  JobPost({
    required this.jobTitle,
    required this.jobDescription,
    required this.recruiterEmail,
  });
}
