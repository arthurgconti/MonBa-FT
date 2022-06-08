import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:monba_ft/enum/statusEnum.dart';
import 'package:monba_ft/model/banheiroPA.dart';

import '../model/banheiro.dart';
import '../model/banheiroBandeco.dart';
import '../model/banheiroBiblioteca.dart';
import '../model/banheiroLP.dart';
import '../model/banheiros.dart';
import '../model/usuario.dart';

class FirestoreServer {
  static FirestoreServer helper = FirestoreServer._createInstance();

  FirestoreServer._createInstance();
  String? uid;

  final CollectionReference bathroomCollection =
      FirebaseFirestore.instance.collection("bathroom");

  Future getBathroom({bathroomId = "banheiro"}) async {
    DocumentSnapshot doc = await bathroomCollection.doc(bathroomId).get();
    Banheiro bath = Banheiro.fromMap(doc.data());
    return bath;
  }

  BathroomCollection _bathroomListFromSnapshot(QuerySnapshot snapshot) {
    BathroomCollection bathCollection = BathroomCollection();
    for (var doc in snapshot.docs) {
      Banheiro bath = Banheiro.fromMap(doc.data());
      bathCollection.insertNoteOfId(doc.id, bath);
    }
    return bathCollection;
  }

  Future<BathroomCollection> getBathroomList() async {
    QuerySnapshot snapshot = await bathroomCollection.get();
    return _bathroomListFromSnapshot(snapshot);
  }

  Future<int> updateBathroom(bathroomId, Banheiro bathroom) async {
    // Response response = await _dio.put(
    //     prefixUrl + bathroomUrl + "/" + bathroomId + suffixUrl,
    //     data: bathroom);
    return 42;
  }

  Future<int?> insertBathroom() async {
    BathroomCollection bathrooms = BathroomCollection();

    bathrooms = await getBathroomList();

    if (bathrooms.length() == 0) {
      final BanheiroPA banheiroPA =
          BanheiroPA(enm_status.parcial, true, true, false, 0, true, false, 0);
      final BanheiroLP banheiroLP = BanheiroLP(
          enm_status.naoInterditado, true, true, false, 0, true, false, 0);

      final BanheiroBandeco banheiroBandeco = BanheiroBandeco(
          enm_status.totalmente, true, true, false, 0, true, false, 0);

      final BanheiroBiblioteca banheiroBiblioteca = BanheiroBiblioteca(
          enm_status.naoInterditado, true, true, false, 0, true, false, 0);

      DocumentReference ref = await bathroomCollection.add(banheiroPA);
      ref = await bathroomCollection.add(banheiroLP);
      ref = await bathroomCollection.add(banheiroBandeco);
      ref = await bathroomCollection.add(banheiroBiblioteca);
    }

    return 42;
  }

  Future getUser(userId) async {
    // Response response =
    //     await _dio.get(prefixUrl + userUrl + "/" + userId + suffixUrl);
  }

  Future<int> updateUser(userId, User user) async {
    // Response response = await _dio.put(
    //     prefixUrl + userUrl + "/" + userId + suffixUrl,
    //     data: user.toMap());
    return 42;
  }

  Future<int?> insertUser(User user) async {
    // Response response =
    //     // await _dio.post(prefixUrl + userUrl + suffixUrl, data: user.toMap());
    return 42;
  }
}
