import '../model/notifications.dart';

class NotificationBlocState {
  NotificationCollection notifications;

  NotificationBlocState({required this.notifications});
}

class LoadingNotification extends NotificationBlocState {
  LoadingNotification(notifications) : super(notifications: notifications);
}
