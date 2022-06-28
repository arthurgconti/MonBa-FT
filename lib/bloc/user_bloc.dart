import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monba_ft/bloc/user_event.dart';
import 'package:monba_ft/bloc/user_state.dart';
import 'package:monba_ft/model/usuario.dart';

import '../provider/firestore_provider.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  static User currentUser = User("", "", "", "", "", "");

  UserBloc() : super(UserState(currentUser: currentUser)) {
    on<UpdateUserEvent>((event, emit) => {emit(UpdateState(currentUser))});
    on<UpdateCancel>((event, emit) => {emit(InsertState(currentUser))});

    on<SubmitUserEvent>((event, emit) => {
          if (state is InsertState)
            FirestoreServer.helper.insertUser(event.user)
          else if (state is UpdateState)
            {
              FirestoreServer.helper.updateUser(event.user),
              add(RefreshUserInfoEvent())
            }
        });
    on<InitUserEvent>((event, emit) async {
      emit(Loading(currentUser));
      currentUser = await FirestoreServer.helper.getUser();
      emit(UserState(currentUser: currentUser));
    });

    on<RefreshUserInfoEvent>((event, emit) async {
      emit(Loading(currentUser));
      currentUser = await FirestoreServer.helper.getUser();
      emit(UserState(currentUser: currentUser));
    });
  }
}
