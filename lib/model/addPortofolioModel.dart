class AddPortfolioModel {
  bool? status;
  Data? data;

  AddPortfolioModel({this.status, this.data});

  AddPortfolioModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? false;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'status': status,
      'data': this.data?.toJson(), // Using safe navigation operator (?.) here
    };
    return data;
  }
}

class Data {
  late String name;
  late String image;
  late int userId;
  late String updatedAt;
  late String createdAt;
  late int id;

  Data({
    required this.name,
    required this.image,
    required this.userId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    image = json['image'] ?? '';
    userId = json['user_id'] ?? 0;
    updatedAt = json['updated_at'] ?? '';
    createdAt = json['created_at'] ?? '';
    id = json['id'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'user_id': userId,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }
}
