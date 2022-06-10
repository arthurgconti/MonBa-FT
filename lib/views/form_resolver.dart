import 'package:monba_ft/enum/notificarEnum.dart';
import 'package:monba_ft/enum/resolverEnum.dart';
import 'package:monba_ft/enum/statusEnum.dart';

class ResolveForm {
  static Enum statusRadio = enm_status.nenhum;
  static Enum papelHigienicoRadio = enm_toiletPaper.none;
  static Enum papelToalhaRadio = enm_paperTowel.none;
  static Enum piaRadio = enm_fixedSink.none;
  static Enum privadaRadio = enm_fixedToilet.none;
  static Enum saboneteRadio = enm_soap.none;

  static int privadasDefeituosas = -1;
  static int piasDefeituosas = -1;
}
