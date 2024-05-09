class ChangeNameOrPasswordModel {
  bool? status;
  ChangeNameOrPasswordData? data;

  ChangeNameOrPasswordModel({this.status, this.data});

  ChangeNameOrPasswordModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? ChangeNameOrPasswordData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ChangeNameOrPasswordData {
  int? id;
  String? name;
  String? otp;
  Null? towStep;
  String? email;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  ChangeNameOrPasswordData(
      {this.id,
        this.name,
        this.otp,
        this.towStep,
        this.email,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt});

  ChangeNameOrPasswordData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    otp = json['otp'];
    towStep = json['tow_step'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['otp'] = otp;
    data['tow_step'] = towStep;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
