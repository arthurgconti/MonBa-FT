import 'package:bloc/bloc.dart';

import '../model/banheiros.dart';
import '../provider/rest_provider.dart';
import 'bathroom_monitor_event.dart';
import 'bathroom_monitor_state.dart';

class BathroomMonitorBloc
    extends Bloc<BathroomMonitorEvent, BathroomMonitorState> {
  static BathroomCollection bathrooms = BathroomCollection();

  BathroomMonitorBloc() : super(BathroomMonitorState(bathrooms: bathrooms)) {
    on<AskNewList>(((event, emit) async {
      bathrooms = await RestServer.helper.getBathroomList();
      emit(BathroomMonitorState(bathrooms: bathrooms));
    }));
    add(AskNewList());
  }
}
