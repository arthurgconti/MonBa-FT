import 'package:monba_ft/model/banheiro.dart';

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
