

class RegisterResponseModel {
  RegisterResponseModel({
      this.success, 
      this.message, 
      this.cause, 
      this.data,});

  RegisterResponseModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    cause = json['cause'] != null ? Cause.fromJson(json['cause']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? success;
  String? message;
  Cause? cause;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (cause != null) {
      map['cause'] = cause?.toJson();
    }
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// userId : 2

class Data {
  Data({
      this.userId,});

  Data.fromJson(dynamic json) {
    userId = json['userId'];
  }
  num? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    return map;
  }

}

/// username : ["Username should have more than 5 characters"]
/// password : ["Password should have at least a lowercase letter and a number"]

class Cause {
  Cause({
      this.username, 
      this.password,});

  Cause.fromJson(dynamic json) {
    username = json['username'] != null ? json['username'].cast<String>() : [];
    password = json['password'] != null ? json['password'].cast<String>() : [];
  }
  List<String>? username;
  List<String>? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['password'] = password;
    return map;
  }

}