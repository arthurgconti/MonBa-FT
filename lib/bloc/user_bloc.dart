import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monba_ft/bloc/user_event.dart';
import 'package:monba_ft/bloc/user_state.dart';

import '../provider/firestore_provider.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(InsertState()) {
    on<UpdateUserEvent>((event, emit) =>
        {emit(UpdateState(userId: event.userId, usuario: event.user))});
    on<UpdateCancel>((event, emit) => {emit(InsertState())});

    on<SubmitUserEvent>((event, emit) => {
          if (state is InsertState)
            FirestoreServer.helper.insertUser(event.user)
          else if (state is UpdateState)
            FirestoreServer.helper.updateUser(event.user)
        });
  }
}
