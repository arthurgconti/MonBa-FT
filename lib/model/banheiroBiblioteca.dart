import '../enum/statusEnum.dart';
import 'banheiro.dart';

class BanheiroBiblioteca extends Banheiro {
  BanheiroBiblioteca(
      enm_status status,
      bool toiletPaper,
      bool towelPaper,
      bool defectiveSink,
      int quantityDefectiveSink,
      bool soap,
      bool defectiveToilet,
      int quantityDefectiveToilet)
      : super(
            "assets/images/banheiroBiblioteca.jpeg",
            "Biblioteca",
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

  BanheiroBiblioteca.fromMap(map) : super.fromMap(map);
}
