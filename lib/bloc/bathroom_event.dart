import 'package:monba_ft/model/banheiro.dart';
import 'package:monba_ft/model/banheiros.dart';

abstract class BathroomEvent {}

class SubmitBathroomNotification extends BathroomEvent {
  Banheiro bathroom;
  SubmitBathroomNotification({required this.bathroom});
}

class UpdateBathroomEvent extends BathroomEvent {
  String bathroomId;
  Banheiro previousBathroom;
  UpdateBathroomEvent(
      {required this.bathroomId, required this.previousBathroom});
}

class UpdateCancel extends BathroomEvent {}

class GetBathrooms extends BathroomEvent {
  BathroomCollection bathrooms;
  GetBathrooms({required this.bathrooms});
}
