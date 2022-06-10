import 'package:monba_ft/model/banheiros.dart';

class BathroomMonitorState {
  BathroomCollection bathrooms;

  BathroomMonitorState({required this.bathrooms});
}

class Loading extends BathroomMonitorState {
  Loading(bathrooms) : super(bathrooms: bathrooms);
}

class Loaded extends BathroomMonitorState {
  Loaded(bathrooms) : super(bathrooms: bathrooms);
}
