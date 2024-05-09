class UserData {
  Data? data;
  bool? status;

  UserData({this.data, this.status});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }


}

class Data {
  int? id;
  String? name;
  String? email;
  String? createdAt;
  String? updatedAt;

  Data({this.id, this.name, this.email, this.createdAt, this.updatedAt});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id']??0,
      name: json['name']??'',
      email: json['email']??'',
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


