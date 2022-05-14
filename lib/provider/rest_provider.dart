import 'package:dio/dio.dart';
import 'package:monba_ft/model/banheiroPA.dart';

import '../model/banheiro.dart';
import '../model/banheiroLP.dart';

class RestServer {
  static RestServer helper = RestServer._createInstance();

  RestServer._createInstance();

  final Dio _dio = Dio();
  String prefixUrl = "https://monba-ft-default-rtdb.firebaseio.com/";
  String suffixUrl = "/.json";

  Future getBathroomLP({bathroomId = "banheiro"}) async {
    Response response = await _dio.get(prefixUrl + bathroomId + suffixUrl);
    print(response.data);
  }

  Future<int> updateBathroom(bathroomId, Banheiro bathroom) async {
    Response response =
        await _dio.put(prefixUrl + bathroomId + suffixUrl, data: bathroom);
    return 42;
  }

  Future<String> insertBathroom(Banheiro bathroom) async {
    Response response = await _dio.post(prefixUrl + suffixUrl, data: bathroom);
    return response.data;
  }
}
