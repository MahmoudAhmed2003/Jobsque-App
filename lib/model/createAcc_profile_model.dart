

class CreateAccProfileModel {
  bool? status;
  Data? data;
  Profile? profile;
  String? token;

  CreateAccProfileModel({
    this.status,
    this.data,
    this.profile,
    this.token
  });

  CreateAccProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] =Data.fromJson(json['data']) ;
    profile =
        json['profile'] = Profile.fromJson(json['profile']) ;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic> {};
    data['status'] = status;
    data['data'] = this.data!.toJson();
    data['profile'] = profile!.toJson();
    data['token'] = token;
    return data;
  }
}

class Data {
  String? name;
  String? email;
  int? otp;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.name,
      this.email,
      this.otp,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name']??'';
    email = json['email']??'';
    otp = json['otp']??0;
    updatedAt = json['updated_at']??'';
    createdAt = json['created_at']??'';
    id = json['id']??0;
  }

   Map<String, dynamic> toJson() {
    final data =<String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['otp'] = otp;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}

class Profile {
  int? userId;
  String? name;
  String? email;
  String? updatedAt;
  String? createdAt;
  int? id;

  Profile(
      {this.userId,
      this.name,
      this.email,
      this.updatedAt,
      this.createdAt,
      this.id});

  Profile.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data=<String, dynamic> {};
    data['user_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}


class SentData {
  String? name;
  String? email;
  String? password;

  SentData(
      {
        this.name,
        this.email,
         this.password

      });

  Map<String, dynamic> toJson() {
    final data =<String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
