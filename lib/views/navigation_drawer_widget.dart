import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monba_ft/bloc/notification_bloc.dart';

import '../bloc/notification_bloc_state.dart';

class NavigationDrawerWidget extends ListView {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 154, 182, 55),
      child: Expanded(
        child: ListView(
          children: [
            const Card(
                color: Color.fromARGB(255, 180, 180, 180),
                child: ListTile(
                    title: Text("Últimas Notificações"),
                    leading: Icon(Icons.circle_notifications_rounded))),
            const Divider(),
            BlocBuilder<NotificationMonitorBloc, NotificationBlocState>(
                builder: (context, state) {
              if (state is LoadingNotification) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(children: [
                  ...state.notifications.notificationList
                      .map(
                        (notification) => Card(
                            color: Color.fromARGB(255, 180, 180, 180),
                            child: ListTile(
                              title: Text(notification.getLocation),
                              subtitle: Text(notification.getStrStatus),
                            )),
                      )
                      .toList()
                ]);
              }
            }),
          ],
        ),
      ),
    );
  }
}

// child: Container(
//   color: Color.fromARGB(190, 188, 224, 56),
//   child: ListView(
//     padding: padding,
//     children: Card(
//           child: ListTile(
//               title: Text(widget.bathroomName),
//               leading: const Icon(Icons.location_on))),

// children: <Widget> [
//   const SizedBox(height: 48),
// buildMenuItem(
//   text: 'Colocar Algo',
//   icon: Icons.people,
// )

// Widget buildMenuItem({
//   required String text,
//   required IconData icon,
// }) {
//   final color = Colors.black;

//   return ListTile(
//     leading: Icon(icon, color: color),
//     title: Text(text, style: TextStyle(color: color)),
//     onTap: () {},
//   );
// }
