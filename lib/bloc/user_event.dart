import '../model/usuario.dart';

abstract class UserEvent {}

class SubmitUserEvent extends UserEvent {
  User user;
  SubmitUserEvent({required this.user});
}

class UpdateUserEvent extends UserEvent {
  User user;

  UpdateUserEvent({required this.user});
}

class RefreshUserInfoEvent extends UserEvent {}

class UpdateCancel extends UserEvent {}

class InitUserEvent extends UserEvent {}
