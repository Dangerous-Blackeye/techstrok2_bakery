class LoginModel {
  Data? data;
  String? message;
  bool? status;

  LoginModel({this.data, this.message, this.status});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  User? user;
  String? accessToken;

  Data({this.user, this.accessToken});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['access_token'] = this.accessToken;
    return data;
  }
}

class User {
  int? branchId;
  int? userId;
  String? userName;
  int? factoryId;

  User({this.branchId, this.userId, this.userName, this.factoryId});

  User.fromJson(Map<String, dynamic> json) {
    branchId = json['branchId'];
    userId = json['userId'];
    userName = json['userName'];
    factoryId = json['factoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branchId'] = this.branchId;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['factoryId'] = this.factoryId;
    return data;
  }
}
