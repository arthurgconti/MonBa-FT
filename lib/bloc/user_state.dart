import '../model/usuario.dart';

class UserState {
  User currentUser;
  UserState({required this.currentUser});
}

class InsertState extends UserState {
  InsertState(currentUser) : super(currentUser: currentUser);
}

class UpdateState extends UserState {
  UpdateState(currentUser) : super(currentUser: currentUser);
}

class Loading extends UserState {
  Loading(currentUser) : super(currentUser: currentUser);
}
