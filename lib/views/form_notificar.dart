import 'package:monba_ft/enum/notificarEnum.dart';
import 'package:monba_ft/enum/statusEnum.dart';

class NotificarForm {
  static Enum statusRadio = enm_status.nenhum;
  static Enum papelHigienicoRadio = enm_toiletPaper.none;
  static Enum papelToalhaRadio = enm_paperTowel.none;
  static bool piaRadio = false;
  static bool saboneteRadio = true;
  static bool privadaRadio = false;

  static int privadasDefeituosas = 0;
  static int piasDefeituosas = 0;
}
