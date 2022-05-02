import '../enum/Status_enum.dart';

abstract class Banheiro {
  String imagePath = '';

  String location = '';
  String strStatus = '';
  enm_status status = enm_status.naoInterditado;

  bool toiletPaper = true;
  bool towelPaper = true;

  int sinkQuantity = 1;
  bool defectiveSink = false;
  int quantityDefectiveSink = 0;

  bool soap = true;
  int quantitySoapSupport = 1;

  int toiletQuantity = 1;
  bool defectiveToilet = false;
  int quantityDefectiveToilet = 0;

  Banheiro(
      String bathImagePath,
      String bathLocation,
      enm_status bathStatus,
      bool bathToiletPaper,
      bool bathTowelPaper,
      int bathSinkQuantity,
      bool bathDefectiveSink,
      int bathQuantityDefectiveSink,
      bool bathSoap,
      int bathQuantitySoapSupport,
      int bathToiletQuantity,
      bool bathDefectiveToilet,
      int bathQuantityDefectiveToilet) {
    imagePath = bathImagePath;
    location = bathLocation;
    status = bathStatus;
    toiletPaper = bathToiletPaper;
    towelPaper = bathTowelPaper;
    sinkQuantity = bathSinkQuantity;
    defectiveSink = bathDefectiveSink;
    quantityDefectiveSink = bathQuantityDefectiveSink;
    soap = bathSoap;
    quantitySoapSupport = bathQuantitySoapSupport;
    toiletQuantity = bathToiletQuantity;
    defectiveToilet = bathDefectiveToilet;
    quantityDefectiveToilet = bathQuantityDefectiveToilet;

    switch (bathStatus) {
      case enm_status.parcial:
        strStatus = "Parcialmente interditado";
        break;
      case enm_status.totalmente:
        strStatus = "Interditado";
        break;
      default:
        strStatus = "Não interditado";
        break;
    }
  }
}
