import 'package:flutter/cupertino.dart';
import 'package:sustaina/infrastructure/models/users.dart';

class UsersTextControllerModel {
  TextEditingController? email;
  TextEditingController? password;

  UsersTextControllerModel({
    this.email,
    this.password,
  });

  UsersTextControllerModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  User toModel() => User(
        email: email!.text,
        password: password!.text,
      );
}