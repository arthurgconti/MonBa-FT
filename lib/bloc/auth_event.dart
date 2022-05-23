import '../model/userModel.dart';

abstract class AuthEvent {}

class RegisterUser extends AuthEvent {
  String email;
  String password;

  RegisterUser({required this.email, required this.password});
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
