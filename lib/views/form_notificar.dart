import 'dart:core';

class NotificarForm {
  int statusRadio = 0;
  int papelHigienicoRadio = 1;
  int papelToalhaRadio = 0;
  int piaRadio = 0;
  int saboneteRadio = 0;
  int privadaRadio = 0;

  int privadasDefeituosas = 0;
  int piasDefeituosas = 0;

  get getStatusRadio {
    return statusRadio;
  }

  get getPapelHigienicoRadio {
    return papelHigienicoRadio;
  }

  get getPapelToalhaRadio {
    return papelToalhaRadio;
  }

  get getPiaRadio {
    return piaRadio;
  }

  get getSaboneteRadio {
    return saboneteRadio;
  }

  get getPrivadaRadio {
    return privadaRadio;
  }
}
