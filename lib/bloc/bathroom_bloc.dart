import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monba_ft/bloc/bathroom_event.dart';
import 'package:monba_ft/bloc/bathroom_state.dart';
import 'package:monba_ft/provider/rest_provider.dart';

class BathroomBloc extends Bloc<BathroomEvent, BathroomState> {
  BathroomBloc() : super(InsertState()) {
    on<UpdateBathroomEvent>((event, emit) => {
          emit(UpdateState(
              bathroomId: event.bathroomId, bathroom: event.previousBathroom))
        });
    on<UpdateCancel>((event, emit) => {emit(InsertState())});

    on<SubmitBathroomNotification>((event, emit) => {
          if (state is InsertState)
            RestServer.helper.insertBathroom(event.bathroom)
          else if (state is UpdateState)
            RestServer.helper.updateBathroom(
                (state as UpdateState).bathroomId, event.bathroom)
        });
  }
}
