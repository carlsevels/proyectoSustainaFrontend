
import 'package:sustaina/infrastructure/models/users.dart';

class Authentication {
  String? strategy;
  String? accessToken;
  Payload? payload;
  User? user;

  Authentication(
      {this.strategy, this.accessToken, this.payload, this.user});

  Authentication.fromJson(Map<String, dynamic> json) {
    strategy = json["authentication"] != null
        ? json["authentication"]['strategy']
        : json["strategy"];
    accessToken = json['accessToken'];
    payload = json["authentication"] != null
        ? Payload?.fromJson(json["authentication"]['payload'])
        : Payload?.fromJson(json['payload']);
    user = json['user'] != null ? User.fromJson(json["user"]) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['strategy'] = strategy;
    data['accessToken'] = accessToken;
    if (payload != null) {
      data['payload'] = payload?.toJson();
    }
    if (user != null) {
      data["user"] = user?.toJson();
    }
    return data;
  }
}

class Payload {
  int? iat;
  int? exp;
  String? aud;
  String? iss;
  String? sub;
  String? jti;

  Payload({this.iat, this.exp, this.aud, this.iss, this.sub, this.jti});

  Payload.fromJson(Map<String, dynamic> json) {
    iat = json['iat'];
    exp = json['exp'];
    aud = json['aud'];
    iss = json['iss'];
    sub = json['sub'];
    jti = json['jti'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['iat'] = iat;
    data['exp'] = exp;
    data['aud'] = aud;
    data['iss'] = iss;
    data['sub'] = sub;
    data['jti'] = jti;
    return data;
  }
}
