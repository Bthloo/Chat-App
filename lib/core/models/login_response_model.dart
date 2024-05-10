

class LoginResponseModel {
  LoginResponseModel({
      this.success, 
      this.message, 
      this.data, 
      this.cause,});

  LoginResponseModel.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    cause = json['cause'];
  }
  bool? success;
  String? message;
  Data? data;
  String? cause;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['cause'] = cause;
    return map;
  }

}

/// username : "test11"
/// accessToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwidXNlcm5hbWUiOiJ0ZXN0MTEiLCJleHAiOjE3MTUzODk1MTksImlhdCI6MTcxNTMwMzExOX0.n_8Ypvlf9TbDlr16S_c6TIjfbUQenSKLCZEtQT4Ri3I"
/// refreshToken : "e811447e387d28fc4c2e6cbdac757552fbcf206ac04b393eef94b3ee23feba43ef187d1a37aad62c17132d147338302534679319520bf16f942d981eb0757e70"

class Data {
  Data({
      this.username, 
      this.accessToken, 
      this.refreshToken,});

  Data.fromJson(dynamic json) {
    username = json['username'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }
  String? username;
  String? accessToken;
  String? refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['accessToken'] = accessToken;
    map['refreshToken'] = refreshToken;
    return map;
  }

}