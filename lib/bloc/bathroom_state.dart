import 'package:monba_ft/model/banheiro.dart';

abstract class BathroomState {}

class InsertState extends BathroomState {}

class UpdateState extends BathroomState {
  String bathroomId;
  Banheiro bathroom;

  UpdateState({required this.bathroomId, required this.bathroom});
}