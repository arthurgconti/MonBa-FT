import 'dart:core';

class NotificarForm {
  int statusRadio = 1;
  int papelHigienicoRadio = 2;
  int papelToalhaRadio = 3;
  int piaRadio = 4;
  int saboneteRadio = 5;
  int privadaRadio = 6;

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
