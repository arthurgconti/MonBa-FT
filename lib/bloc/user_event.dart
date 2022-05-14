import '../model/usuario.dart';

abstract class UserEvent {}

class SubmitUserEvent extends UserEvent {
  User user;
  SubmitUserEvent({required this.user});
}

class UpdateUserEvent extends UserEvent {
  String userId;
  User user;

  UpdateUserEvent({required this.userId, required this.user});
}

class UpdateCancel extends UserEvent {}
