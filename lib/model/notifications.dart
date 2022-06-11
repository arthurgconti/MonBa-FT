import 'package:monba_ft/model/notification.dart';

class NotificationCollection {
  List<String> idList = [];
  List<BathNotification> notificationList = [];

  NotificationCollection() {
    idList = [];
    notificationList = [];
  }

  void printList() {
    for (var i = 0; i < notificationList.length; i++) {
      print("Id: " + idList[i]);
      print("| Notification: " + notificationList[i].getLocation + "\n");
    }
  }

  int length() {
    return idList.length;
  }

  BathNotification notification(int index) {
    return notificationList[index];
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

  updateOrInsertNoteOfId(String id, BathNotification notification) {
    int index = getIndexOfId(id);
    if (index != -1) {
      notificationList[index] = notification;
    } else {
      idList.add(id);
      notificationList.add(notification);
    }
  }

  updateNoteOfId(String id, BathNotification notification) {
    int index = getIndexOfId(id);
    if (index != -1) {
      notificationList[index] = notification;
    }
  }

  deleteNoteOfId(String id) {
    int index = getIndexOfId(id);
    if (index != -1) {
      notificationList.removeAt(index);
      idList.removeAt(index);
    }
  }

  insertNoteOfId(String id, BathNotification notification) {
    idList.add(id);
    notificationList.add(notification);
  }
}
