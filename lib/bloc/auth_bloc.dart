import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monba_ft/bloc/auth_event.dart';

import '../model/userModel.dart';
import '../provider/firebase_auth.dart';
import '../provider/firestore_provider.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthenticationService _authenticationService =
      FirebaseAuthenticationService();
  AuthBloc() : super(Unauthenticated()) {
    _authenticationService.user.listen((event) {
      print(event);
      if (event is UserModel) {
        add(AuthServerEvent(event));
      }
    });
    on<AuthServerEvent>((event, emit) {
      print(event.userModel?.uid);
      if (event.userModel == null) {
        emit(Unauthenticated());
      } else {
        FirestoreServer.helper.uid = event.userModel!.uid;
        emit(Authenticated(userModel: event.userModel!));
      }
    });

    on<RegisterUser>((event, emit) async {
      try {
        var newUser =
            await _authenticationService.createUserWithEmailAndPassword(
                event.user.getEmail, event.user.getPassword);
        event.user.setUid = newUser!.uid;
        FirestoreServer.helper.insertUser(event.user);
        emit(Unauthenticated());
      } catch (e) {
        emit(AuthError(message: "Impossível Registrar: ${e.toString()}"));
      }
    });

    on<LoginUser>((event, emit) async {
      try {
        UserModel? user = await _authenticationService
            .singInWithEmailAndPassword(event.email, event.password);
        if (user != null) {
          emit(Authenticated(userModel: user));
        } else {
          emit(Unauthenticated());
        }
      } catch (e) {
        emit(AuthError(
            message: "Impossível Logar com ${event.email}: ${e.toString()}"));
      }
    });

    on<Logout>((event, emit) async {
      try {
        await _authenticationService.singOut();
        FirestoreServer.helper.uid = "";
        emit(Unauthenticated());
      } catch (e) {
        emit(AuthError(message: "Impossível fetuar logout: ${e.toString()}"));
      }
    });
  }
}
