import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:monba_ft/enum/statusEnum.dart';
import 'package:monba_ft/model/banheiroPA.dart';
import 'package:monba_ft/model/notification.dart';

import '../model/banheiro.dart';
import '../model/banheiroBandeco.dart';
import '../model/banheiroBiblioteca.dart';
import '../model/banheiroLP.dart';
import '../model/banheiros.dart';
import '../model/notifications.dart';
import '../model/usuario.dart';

class FirestoreServer {
  static FirestoreServer helper = FirestoreServer._createInstance();

  FirestoreServer._createInstance();
  String? uid;

  final CollectionReference bathroomCollection =
      FirebaseFirestore.instance.collection("bathroom");
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("user");

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
    await bathroomCollection.doc(bathroomId).update({
      "status": bathroom.getStrStatus,
      "toiletPaper": bathroom.getToiletPaper,
      "towelPaper": bathroom.getTowelPaper,
      "defectiveSink": bathroom.getDefectiveSink,
      "quantityDefectiveSink": bathroom.getQuantityDefectiveSink,
      "soap": bathroom.getSoap,
      "quantitySoapSupport": bathroom.getQuantitySoapSupport,
      "defectiveToilet": bathroom.getDefectiveToilet,
      "quantityDefectiveToilet": bathroom.getQuantityDefectiveToilet
    });
    return 42;
  }

  NotificationCollection _notificationListFromSnapshot(QuerySnapshot snapshot) {
    NotificationCollection notiCollection = NotificationCollection();
    for (var doc in snapshot.docs) {
      BathNotification noti = BathNotification.fromMap(doc.data());
      notiCollection.insertNoteOfId(doc.id, noti);
    }
    return notiCollection;
  }

  Future<NotificationCollection> getNotificationUserList() async {
    QuerySnapshot snapshot =
        await userCollection.doc(uid).collection("my_notifications").get();
    return _notificationListFromSnapshot(snapshot);
  }

  Future<int?> notify(BathNotification notification) async {
    DocumentReference ref =
        await userCollection.doc(uid).collection("my_notifications").add({
      "date": notification.getNotificaitonDate,
      "location": notification.getLocation,
      "status": notification.getStrStatus,
      "toiletPaper": notification.getToiletPaper,
      "towelPaper": notification.getTowelPaper,
      "defectiveSink": notification.getDefectiveSink,
      "quantityDefectiveSink": notification.getQuantityDefectiveSink,
      "soap": notification.getSoap,
      "defectiveToilet": notification.getDefectiveToilet,
      "quantityDefectiveToilet": notification.getQuantityDefectiveToilet
    });
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

      DocumentReference ref = await bathroomCollection.add({
        "imagePath": banheiroPA.getImagePath,
        "location": banheiroPA.getLocation,
        "status": banheiroPA.getStrStatus,
        "toiletPaper": banheiroPA.getToiletPaper,
        "towelPaper": banheiroPA.getTowelPaper,
        "sinkQuantity": banheiroPA.getSinkQuantity,
        "defectiveSink": banheiroPA.getDefectiveSink,
        "quantityDefectiveSink": banheiroPA.getQuantityDefectiveSink,
        "soap": banheiroPA.getSoap,
        "quantitySoapSupport": banheiroPA.getQuantitySoapSupport,
        "toiletQuantity": banheiroPA.getToiletQuantity,
        "defectiveToilet": banheiroPA.getDefectiveToilet,
        "quantityDefectiveToilet": banheiroPA.getQuantityDefectiveToilet
      });
      ref = await bathroomCollection.add({
        "imagePath": banheiroLP.getImagePath,
        "location": banheiroLP.getLocation,
        "status": banheiroLP.getStrStatus,
        "toiletPaper": banheiroLP.getToiletPaper,
        "towelPaper": banheiroLP.getTowelPaper,
        "sinkQuantity": banheiroLP.getSinkQuantity,
        "defectiveSink": banheiroLP.getDefectiveSink,
        "quantityDefectiveSink": banheiroLP.getQuantityDefectiveSink,
        "soap": banheiroLP.getSoap,
        "quantitySoapSupport": banheiroLP.getQuantitySoapSupport,
        "toiletQuantity": banheiroLP.getToiletQuantity,
        "defectiveToilet": banheiroLP.getDefectiveToilet,
        "quantityDefectiveToilet": banheiroLP.getQuantityDefectiveToilet
      });
      ref = await bathroomCollection.add({
        "imagePath": banheiroBandeco.getImagePath,
        "location": banheiroBandeco.getLocation,
        "status": banheiroBandeco.getStrStatus,
        "toiletPaper": banheiroBandeco.getToiletPaper,
        "towelPaper": banheiroBandeco.getTowelPaper,
        "sinkQuantity": banheiroBandeco.getSinkQuantity,
        "defectiveSink": banheiroBandeco.getDefectiveSink,
        "quantityDefectiveSink": banheiroBandeco.getQuantityDefectiveSink,
        "soap": banheiroBandeco.getSoap,
        "quantitySoapSupport": banheiroBandeco.getQuantitySoapSupport,
        "toiletQuantity": banheiroBandeco.getToiletQuantity,
        "defectiveToilet": banheiroBandeco.getDefectiveToilet,
        "quantityDefectiveToilet": banheiroBandeco.getQuantityDefectiveToilet
      });
      ref = await bathroomCollection.add({
        "imagePath": banheiroBiblioteca.getImagePath,
        "location": banheiroBiblioteca.getLocation,
        "status": banheiroBiblioteca.getStrStatus,
        "toiletPaper": banheiroBiblioteca.getToiletPaper,
        "towelPaper": banheiroBiblioteca.getTowelPaper,
        "sinkQuantity": banheiroBiblioteca.getSinkQuantity,
        "defectiveSink": banheiroBiblioteca.getDefectiveSink,
        "quantityDefectiveSink": banheiroBiblioteca.getQuantityDefectiveSink,
        "soap": banheiroBiblioteca.getSoap,
        "quantitySoapSupport": banheiroBiblioteca.getQuantitySoapSupport,
        "toiletQuantity": banheiroBiblioteca.getToiletQuantity,
        "defectiveToilet": banheiroBiblioteca.getDefectiveToilet,
        "quantityDefectiveToilet": banheiroBiblioteca.getQuantityDefectiveToilet
      });
    }

    return 42;
  }

  Future<int> updateUser(User user) async {
    var ref = await userCollection.doc(uid).update({
      "name": user.getName,
      "cellphone": user.getCellphone,
      "username": user.getUsername
    });
    return 42;
  }

  Future<int> insertUser(User user) async {
    var ref = await userCollection.doc(user.getUid).set({
      "name": user.getName,
      "ra": user.getRa,
      "email": user.getEmail,
      "cellphone": user.getCellphone,
      "username": user.getUsername
    }, SetOptions(merge: true));
    return 42;
  }

  Future<User> getUser() async {
    DocumentSnapshot doc = await userCollection.doc(uid).get();
    User user = User.fromMap(doc.data());
    return user;
  }
}
