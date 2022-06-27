import 'package:monba_ft/model/usuario.dart';

import '../model/userModel.dart';

abstract class AuthEvent {}

class RegisterUser extends AuthEvent {
  User user;

  RegisterUser({required this.user});
}

class LoginUser extends AuthEvent {
  String email;
  String password;

  LoginUser({required this.email, required this.password});
}

class Logout extends AuthEvent {}

class AuthServerEvent extends AuthEvent {
  final UserModel? userModel;
  AuthServerEvent(this.userModel);
}
