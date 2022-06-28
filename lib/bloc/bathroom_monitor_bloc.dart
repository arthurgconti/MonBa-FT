import 'package:bloc/bloc.dart';
import 'package:monba_ft/provider/firestore_provider.dart';

import '../model/banheiros.dart';
import 'bathroom_monitor_event.dart';
import 'bathroom_monitor_state.dart';

class BathroomMonitorBloc
    extends Bloc<BathroomMonitorEvent, BathroomMonitorState> {
  static BathroomCollection bathrooms = BathroomCollection();

  BathroomMonitorBloc() : super(BathroomMonitorState(bathrooms: bathrooms)) {
    on<AskNewList>(((event, emit) async {
      bathrooms = await FirestoreServer.helper.getBathroomList();
      emit(BathroomMonitorState(bathrooms: bathrooms));
    }));
    on<InitEvent>(((event, emit) async {
      emit(Loading(bathrooms));
      bathrooms = await FirestoreServer.helper.getBathroomList();
      emit(BathroomMonitorState(bathrooms: bathrooms));
    }));
    // add(AskNewList());
  }
}
