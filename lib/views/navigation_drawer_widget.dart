import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends ListView {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context){
    return Drawer(
      backgroundColor: Color.fromARGB(255, 154, 182, 55),
      child: Expanded(
          child: ListView(children: [
            Card(
              color: Color.fromARGB(255, 180, 180, 180),
                child: ListTile(
                    title: Text("Minhas Notificações"),
                    leading: const Icon(Icons.circle_notifications_rounded))),
                    const Divider(),
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