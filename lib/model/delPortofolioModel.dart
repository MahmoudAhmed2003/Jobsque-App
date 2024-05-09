class DelPortofolioModel {
  DelPortofolioModel({
    required this.status,
    required this.massage,
    required this.data,
  });
  late final bool status;
  late final String massage;
  late final Data data;

  DelPortofolioModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    massage = json['massage'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['massage'] = massage;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.cvFile,
    required this.name,
    required this.image,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String cvFile;
  late final String name;
  late final String image;
  late final int userId;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    cvFile = json['cv_file'];
    name = json['name'];
    image = json['image'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['cv_file'] = cvFile;
    _data['name'] = name;
    _data['image'] = image;
    _data['user_id'] = userId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}