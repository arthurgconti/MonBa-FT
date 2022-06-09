import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Container(
        color: Color.fromARGB(190, 188, 224, 56),
        child: ListView(
          padding: padding,
          children: <Widget> [
            const SizedBox(height: 48),
            buildMenuItem(
              text: 'Colocar Algo',
              icon: Icons.people,
            )
          ],
        ),
      ),
    );
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
}) {
  final color = Colors.black;

  return ListTile(
    leading: Icon(icon, color: color),
    title: Text(text, style: TextStyle(color: color)),
    onTap: () {},
  );
}