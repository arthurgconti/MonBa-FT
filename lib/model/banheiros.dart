import 'package:monba_ft/model/banheiro.dart';

class BathroomCollection {
  List<String> idList = [];
  List<Banheiro> bathroomList = [];

  BathroomCollection() {
    idList = [];
    bathroomList = [];
  }

  void printList() {
    for (var i = 0; i < bathroomList.length; i++) {
      print("Id: " + idList[i]);
      print("| Bathroom: " + bathroomList[i].toString() + "\n");
    }
  }

  int length() {
    return idList.length;
  }

  Banheiro bathroom(int index) {
    return bathroomList[index];
  }

  String getIdAtIndex(int index) {
    return idList[index];
  }

  int getIndexOfId(String id) {
    for (int i = 0; i < idList.length; i++) {
      if (id == idList[i]) {
        return i;
      }
    }
    return -1;
  }

  updateOrInsertNoteOfId(String id, Banheiro bathroom) {
    int index = getIndexOfId(id);
    if (index != -1) {
      bathroomList[index] = bathroom;
    } else {
      idList.add(id);
      bathroomList.add(bathroom);
    }
  }

  updateNoteOfId(String id, Banheiro bathroom) {
    int index = getIndexOfId(id);
    if (index != -1) {
      bathroomList[index] = bathroom;
    }
  }

  deleteNoteOfId(String id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      bathroomList.removeAt(index);
      idList.removeAt(index);
    }
  }

  insertNoteOfId(String id, Banheiro bathroom) {
    idList.add(id);
    bathroomList.add(bathroom);
  }
}
