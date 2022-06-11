import 'package:monba_ft/enum/statusEnum.dart';

class BathNotification {
  String _uid = '', _strStatus = '', _location = '';
  String _notificationDate = '';
  Enum _status = enm_status.nenhum;
  bool _toiletPaper = true;
  bool _towelPaper = true;
  bool _defectiveSink = true;
  int _quantityDefectiveSink = -1;
  bool _soap = true;
  bool _defectiveToilet = true;
  int _quantityDefectiveToilet = -1;

  BathNotification(
      String location,
      Enum bathStatus,
      bool bathToiletPaper,
      bool bathTowelPaper,
      bool bathDefectiveSink,
      int bathQuantityDefectiveSink,
      bool bathSoap,
      bool bathDefectiveToilet,
      int bathQuantityDefectiveToilet) {
    _location = location;
    _status = bathStatus;
    _toiletPaper = bathToiletPaper;
    _towelPaper = bathTowelPaper;
    _defectiveSink = bathDefectiveSink;
    _quantityDefectiveSink = bathQuantityDefectiveSink;
    _soap = bathSoap;
    _defectiveToilet = bathDefectiveToilet;
    _quantityDefectiveToilet = bathQuantityDefectiveToilet;

    switch (bathStatus) {
      case enm_status.parcial:
        _strStatus = "Parcialmente interditado";
        break;
      case enm_status.totalmente:
        _strStatus = "Interditado";
        break;
      default:
        _strStatus = "Não interditado";
        break;
    }
  }

  String get getUid => _uid;
  String get getNotificaitonDate => _notificationDate;
  String get getLocation => _location;
  String get getStrStatus => _strStatus;
  Enum get getStatus => _status;
  bool get getToiletPaper => _toiletPaper;
  bool get getTowelPaper => _towelPaper;
  bool get getDefectiveSink => _defectiveSink;
  int get getQuantityDefectiveSink => _quantityDefectiveSink;
  bool get getSoap => _soap;
  bool get getDefectiveToilet => _defectiveToilet;
  int get getQuantityDefectiveToilet => _quantityDefectiveToilet;

  set setUid(String uid) {
    _uid = uid;
  }

  set setNotificationDate(String date) {
    _notificationDate = date;
  }

  set setBathStatus(Enum status) {
    _status = status;
    switch (status) {
      case enm_status.parcial:
        _strStatus = "Parcialmente interditado";
        break;
      case enm_status.totalmente:
        _strStatus = "Interditado";
        break;
      default:
        _strStatus = "Não interditado";
        break;
    }
  }

  set setBathToiletPaper(bool paper) {
    _toiletPaper = paper;
  }

  set setBathTowelPaper(bool paper) {
    _towelPaper = paper;
  }

  set setBathDefectiveSink(bool defectiveSink) {
    _defectiveSink = defectiveSink;
  }

  set setBathQuantityDefectiveSink(int bathQuantityDefectiveSink) {
    _quantityDefectiveSink = bathQuantityDefectiveSink;
  }

  set setBathSoap(bool soap) {
    _soap = soap;
  }

  set setBathDefectiveToilet(bool defectiveToilet) {
    _defectiveToilet = defectiveToilet;
  }

  set setBathQuantityDefectiveToilet(int quantityDefectiveToilet) {
    _quantityDefectiveToilet = quantityDefectiveToilet;
  }

  BathNotification.fromMap(map) {
    _location = map["location"];
    _strStatus = map["status"];
    _toiletPaper = map["toiletPaper"];
    _towelPaper = map["towelPaper"];
    _defectiveSink = map["defectiveSink"];
    _quantityDefectiveSink = map["quantityDefectiveSink"];
    _soap = map["soap"];
    _defectiveToilet = map["defectiveToilet"];
    _quantityDefectiveToilet = map["quantityDefectiveToilet"];

    if (_strStatus == "Parcialmente interditado") {
      _status = enm_status.parcial;
    } else if (_strStatus == "Interditado") {
      _status = enm_status.totalmente;
    } else if (_strStatus == "Não interditado") {
      _status = enm_status.naoInterditado;
    } else {
      _status = enm_status.nenhum;
    }
  }

  toMap() {
    var map = Map<String, dynamic>();
    map["date"] = _notificationDate;
    map["location"] = _location;
    map["status"] = _strStatus;
    map["toiletPaper"] = _toiletPaper;
    map["towelPaper"] = _towelPaper;
    map["defectiveSink"] = _defectiveSink;
    map["quantityDefectiveSink"] = _quantityDefectiveSink;
    map["soap"] = _soap;
    map["defectiveToilet"] = _defectiveToilet;
    map["quantityDefectiveToilet"] = _quantityDefectiveToilet;
    return map;
  }
}
