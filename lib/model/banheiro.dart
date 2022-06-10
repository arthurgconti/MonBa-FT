import '../enum/statusEnum.dart';

class Banheiro {
  String _imagePath = '';
  String _uid = '';

  String _location = '';
  String _strStatus = '';
  Enum _status = enm_status.naoInterditado;

  bool _toiletPaper = true;
  bool _towelPaper = true;

  int _sinkQuantity = 1;
  bool _defectiveSink = false;
  int _quantityDefectiveSink = 0;

  bool _soap = true;
  int _quantitySoapSupport = 1;

  int _toiletQuantity = 1;
  bool _defectiveToilet = false;
  int _quantityDefectiveToilet = 0;

  String get getUid => _uid;
  String get getImagePath => _imagePath;
  String get getLocation => _location;
  String get getStrStatus => _strStatus;
  Enum get getStatus => _status;
  bool get getToiletPaper => _toiletPaper;
  bool get getTowelPaper => _towelPaper;
  int get getSinkQuantity => _sinkQuantity;
  bool get getDefectiveSink => _defectiveSink;
  int get getQuantityDefectiveSink => _quantityDefectiveSink;
  bool get getSoap => _soap;
  int get getQuantitySoapSupport => _quantitySoapSupport;
  int get getToiletQuantity => _toiletQuantity;
  bool get getDefectiveToilet => _defectiveToilet;
  int get getQuantityDefectiveToilet => _quantityDefectiveToilet;

  set setUid(String uid) {
    _uid = uid;
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

  //     int

  Banheiro(
      String bathImagePath,
      String bathLocation,
      Enum bathStatus,
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
    _imagePath = bathImagePath;
    _location = bathLocation;
    _status = bathStatus;
    _toiletPaper = bathToiletPaper;
    _towelPaper = bathTowelPaper;
    _sinkQuantity = bathSinkQuantity;
    _defectiveSink = bathDefectiveSink;
    _quantityDefectiveSink = bathQuantityDefectiveSink;
    _soap = bathSoap;
    _quantitySoapSupport = bathQuantitySoapSupport;
    _toiletQuantity = bathToiletQuantity;
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

  Banheiro.simple(
      Enum bathStatus,
      bool bathToiletPaper,
      bool bathTowelPaper,
      bool bathDefectiveSink,
      int bathQuantityDefectiveSink,
      bool bathSoap,
      bool bathDefectiveToilet,
      int bathQuantityDefectiveToilet) {
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

  Banheiro.fromMap(map) {
    _imagePath = map["imagePath"];
    _location = map["location"];
    _strStatus = map["status"];
    _toiletPaper = map["toiletPaper"];
    _towelPaper = map["towelPaper"];
    _sinkQuantity = map["sinkQuantity"];
    _defectiveSink = map["defectiveSink"];
    _quantityDefectiveSink = map["quantityDefectiveSink"];
    _soap = map["soap"];
    _quantitySoapSupport = map["quantitySoapSupport"];
    _toiletQuantity = map["toiletQuantity"];
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
    map["imagePath"] = _imagePath;
    map["location"] = _location;
    map["status"] = _strStatus;
    map["toiletPaper"] = _toiletPaper;
    map["towelPaper"] = _towelPaper;
    map["sinkQuantity"] = _sinkQuantity;
    map["defectiveSink"] = _defectiveSink;
    map["quantityDefectiveSink"] = _quantityDefectiveSink;
    map["soap"] = _soap;
    map["quantitySoapSupport"] = _quantitySoapSupport;
    map["toiletQuantity"] = _toiletQuantity;
    map["defectiveToilet"] = _defectiveToilet;
    map["quantityDefectiveToilet"] = _quantityDefectiveToilet;
    return map;
  }
}
