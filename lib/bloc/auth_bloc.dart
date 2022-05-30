import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monba_ft/bloc/auth_event.dart';

import '../model/userModel.dart';
import '../provider/firebase_auth.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthenticationService _authenticationService =
      FirebaseAuthenticationService();
  AuthBloc() : super(Unauthenticated()) {
    _authenticationService.user.listen((event) {
      if (event is UserModel) {
        add(AuthServerEvent(event));
      }
    });
    on<AuthServerEvent>((event, emit) {
      if (event.userModel == null) {
        emit(Unauthenticated());
      } else {
        emit(Authenticated(userModel: event.userModel!));
      }
    });

    on<RegisterUser>((event, emit) async {
      try {
        await _authenticationService.createUserWithEmailAndPassword(
            event.email, event.password);
      } catch (e) {
        emit(AuthError(message: "Impossível Registrar: ${e.toString()}"));
      }
    });

    on<LoginUser>((event, emit) async {
      try {
        await _authenticationService.singInWithEmailAndPassword(
            event.email, event.password);
      } catch (e) {
        emit(AuthError(
            message: "Impossível Logar com ${event.email}: ${e.toString()}"));
      }
    });

    on<Logout>((event, emit) async {
      try {
        await _authenticationService.singOut();
      } catch (e) {
        emit(AuthError(message: "Impossível fetuar logout: ${e.toString()}"));
      }
    });
  }
}
