import '../model/usuario.dart';

abstract class UserState {}

class InsertState extends UserState {}

class UpdateState extends UserState {
  String userId;
  User usuario;

  UpdateState({required this.userId, required this.usuario});
}
