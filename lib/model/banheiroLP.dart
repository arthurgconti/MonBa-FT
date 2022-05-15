import '../enum/statusEnum.dart';
import 'banheiro.dart';

class BanheiroLP extends Banheiro {
  BanheiroLP(
      enm_status status,
      bool toiletPaper,
      bool towelPaper,
      bool defectiveSink,
      int quantityDefectiveSink,
      bool soap,
      bool defectiveToilet,
      int quantityDefectiveToilet)
      : super(
            "assets/images/banheiroLP.jpeg",
            "LP",
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

  BanheiroLP.fromMap(map) : super.fromMap(map);
}
