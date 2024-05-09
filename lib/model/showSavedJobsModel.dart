class ShowSavedJobs {
  bool? status;
  List<ShowSavedData>? data;

  ShowSavedJobs({this.status, this.data});

  ShowSavedJobs.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <ShowSavedData>[];
      json['data'].forEach((v) {
        data!.add(ShowSavedData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShowSavedData {
  int? id;
  int? userId;
  int? like;
  int? jobId;
  String? image;
  String? name;
  String? location;
  String? createdAt;
  String? updatedAt;
  Jobs? jobs;

  ShowSavedData({
    this.id,
    this.userId,
    this.like,
    this.jobId,
    this.image,
    this.name,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.jobs,
  });

  ShowSavedData.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    userId = json['user_id'] ?? 0;
    like = json['like'] ?? 0;
    jobId = json['job_id'] ?? 0;
    image = json['image'] ?? '';
    name = json['name'] ?? '';
    location = json['location'] ?? '';
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
    jobs = json['jobs'] != null ? Jobs.fromJson(json['jobs']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['like'] = like;
    data['job_id'] = jobId;
    data['image'] = image;
    data['name'] = name;
    data['location'] = location;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (jobs != null) {
      data['jobs'] = jobs!.toJson();
    }
    return data;
  }
}

class Jobs {
  int? id;
  String? name;
  String? image;
  String? jobTimeType;
  String? jobType;
  String? jobLevel;
  String? jobDescription;
  String? jobSkill;
  String? compName;
  String? compEmail;
  String? compWebsite;
  String? aboutComp;
  String? location;
  String? salary;
  int? favorites;
  int? expired;
  String? createdAt;
  String? updatedAt;

  Jobs({
    this.id,
    this.name,
    this.image,
    this.jobTimeType,
    this.jobType,
    this.jobLevel,
    this.jobDescription,
    this.jobSkill,
    this.compName,
    this.compEmail,
    this.compWebsite,
    this.aboutComp,
    this.location,
    this.salary,
    this.favorites,
    this.expired,
    this.createdAt,
    this.updatedAt,
  });

  Jobs.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    image = json['image'] ?? '';
    jobTimeType = json['job_time_type'] ?? '';
    jobType = json['job_type'] ?? '';
    jobLevel = json['job_level'] ?? '';
    jobDescription = json['job_description'] ?? '';
    jobSkill = json['job_skill'] ?? '';
    compName = json['comp_name'] ?? '';
    compEmail = json['comp_email'] ?? '';
    compWebsite = json['comp_website'] ?? '';
    aboutComp = json['about_comp'] ?? '';
    location = json['location'] ?? '';
    salary = json['salary'] ?? '';
    favorites = json['favorites'] ?? 0;
    expired = json['expired'] ?? 0;
    createdAt = json['created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['job_time_type'] = jobTimeType;
    data['job_type'] = jobType;
    data['job_level'] = jobLevel;
    data['job_description'] = jobDescription;
    data['job_skill'] = jobSkill;
    data['comp_name'] = compName;
    data['comp_email'] = compEmail;
    data['comp_website'] = compWebsite;
    data['about_comp'] = aboutComp;
    data['location'] = location;
    data['salary'] = salary;
    data['favorites'] = favorites;
    data['expired'] = expired;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
