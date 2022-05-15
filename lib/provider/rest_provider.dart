import 'package:dio/dio.dart';
import 'package:monba_ft/enum/statusEnum.dart';
import 'package:monba_ft/model/banheiroPA.dart';

import '../model/banheiro.dart';
import '../model/banheiroBandeco.dart';
import '../model/banheiroBiblioteca.dart';
import '../model/banheiroLP.dart';
import '../model/banheiros.dart';
import '../model/usuario.dart';

class RestServer {
  static RestServer helper = RestServer._createInstance();

  RestServer._createInstance();

  final Dio _dio = Dio();
  String prefixUrl = "https://monba-ft-default-rtdb.firebaseio.com/";
  String userUrl = "users";
  String bathroomUrl = "bathroom";
  String suffixUrl = "/.json";

  Future getBathroom({bathroomId = "banheiro"}) async {
    Response response = await _dio.get(prefixUrl + bathroomId + suffixUrl);
  }

  Future<BathroomCollection> getBathroomList() async {
    Response response = await _dio.get(prefixUrl + bathroomUrl + suffixUrl);
    BathroomCollection bathroomCollection = BathroomCollection();
    if (response.data != null) {
      response.data.forEach((key, value) {
        Banheiro bathroom = Banheiro.fromMap(value);
        bathroomCollection.insertNoteOfId(key, bathroom);
      });
    }
    return bathroomCollection;
  }

  Future<int> updateBathroom(bathroomId, Banheiro bathroom) async {
    Response response = await _dio.put(
        prefixUrl + bathroomUrl + "/" + bathroomId + suffixUrl,
        data: bathroom);
    return 42;
  }

  Future<int?> insertBathroom() async {
    BathroomCollection bathrooms = BathroomCollection();

    Response response = await _dio.get(prefixUrl + bathroomUrl + suffixUrl);

    if (response.data == null) {
      final BanheiroPA banheiroPA =
          BanheiroPA(enm_status.parcial, true, true, false, 0, true, false, 0);
      final BanheiroLP banheiroLP = BanheiroLP(
          enm_status.naoInterditado, true, true, false, 0, true, false, 0);

      final BanheiroBandeco banheiroBandeco = BanheiroBandeco(
          enm_status.totalmente, true, true, false, 0, true, false, 0);

      final BanheiroBiblioteca banheiroBiblioteca = BanheiroBiblioteca(
          enm_status.naoInterditado, true, true, false, 0, true, false, 0);
      await _dio.post(prefixUrl + bathroomUrl + suffixUrl,
          data: banheiroPA.toMap());
      await _dio.post(prefixUrl + bathroomUrl + suffixUrl,
          data: banheiroLP.toMap());
      await _dio.post(prefixUrl + bathroomUrl + suffixUrl,
          data: banheiroBandeco.toMap());
      response = await _dio.post(prefixUrl + bathroomUrl + suffixUrl,
          data: banheiroBiblioteca.toMap());
    }

    return response.statusCode;
  }

  Future getUser(userId) async {
    Response response =
        await _dio.get(prefixUrl + userUrl + "/" + userId + suffixUrl);
  }

  Future<int> updateUser(userId, User user) async {
    Response response = await _dio.put(
        prefixUrl + userUrl + "/" + userId + suffixUrl,
        data: user.toMap());
    return 42;
  }

  Future<int?> insertUser(User user) async {
    Response response =
        await _dio.post(prefixUrl + userUrl + suffixUrl, data: user.toMap());
    return response.statusCode;
  }
}
