import '../enum/statusEnum.dart';
import 'banheiro.dart';

class BanheiroPA extends Banheiro {
  BanheiroPA(
      enm_status status,
      bool toiletPaper,
      bool towelPaper,
      bool defectiveSink,
      int quantityDefectiveSink,
      bool soap,
      bool defectiveToilet,
      int quantityDefectiveToilet)
      : super(
            "assets/images/banheiroPA.jpeg",
            "PA",
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

  BanheiroPA.fromMap(map) : super.fromMap(map);
}
