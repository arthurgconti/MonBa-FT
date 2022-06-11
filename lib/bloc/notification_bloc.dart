import 'package:bloc/bloc.dart';

import '../model/notifications.dart';
import '../provider/firestore_provider.dart';
import 'notification_bloc_event.dart';
import 'notification_bloc_state.dart';

class NotificationMonitorBloc
    extends Bloc<NotificationBlocEvent, NotificationBlocState> {
  static NotificationCollection notifications = NotificationCollection();
  NotificationMonitorBloc()
      : super(NotificationBlocState(notifications: notifications)) {
    on<AskListNotification>((event, emit) async {
      notifications = await FirestoreServer.helper.getNotificationUserList();
      emit(NotificationBlocState(notifications: notifications));
    });
    on<InitNotificationEvent>((event, emit) async {
      emit(LoadingNotification(notifications));
      notifications = await FirestoreServer.helper.getNotificationUserList();
      emit(NotificationBlocState(notifications: notifications));
    });
  }
}
