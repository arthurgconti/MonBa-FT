import '../enum/statusEnum.dart';
import 'banheiro.dart';

class BanheiroBandeco extends Banheiro {
  BanheiroBandeco(
      enm_status status,
      bool toiletPaper,
      bool towelPaper,
      bool defectiveSink,
      int quantityDefectiveSink,
      bool soap,
      bool defectiveToilet,
      int quantityDefectiveToilet)
      : super(
            "assets/images/banheiroBandeco.jpeg",
            "Bandeco",
            status,
            toiletPaper,
            towelPaper,
            2,
            defectiveSink,
            quantityDefectiveSink,
            soap,
            2,
            2,
            defectiveToilet,
            quantityDefectiveToilet);

  BanheiroBandeco.fromMap(map) : super.fromMap(map);
}
