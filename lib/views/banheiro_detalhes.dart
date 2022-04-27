import 'package:flutter/material.dart';

class BanheiroDetalhesScreen extends StatefulWidget {
  const BanheiroDetalhesScreen({Key? key}) : super(key: key);

  @override
  State<BanheiroDetalhesScreen> createState() => _BanheiroDetalhesScreenState();
}

class _BanheiroDetalhesScreenState extends State<BanheiroDetalhesScreen> {
  var _currentScreen = 0;

  Widget BanheiroDetalhes() {
    return Row(children: [
      Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(55),
              border: Border.all(color: Colors.black, width: 6)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(49),
              child: Image.asset(
                'assets/images/banheiro.jpg',
                width: 200,
                height: 200,
              ))),
      Column(
        children: [
          ListView(
            children: const [ListTile(title: Text('PA'), leading: Icon(Icons.pin_drop)),
            ListTile(title: Text('Interditado'), leading: Icon(Icons.info))
            ],
          )
        ],
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: const Color(0xff818274)),
        body:
            IndexedStack(index: _currentScreen, children: [BanheiroDetalhes()]),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.feed), label: "De talhes"),
            BottomNavigationBarItem(
                icon: Icon(Icons.campaign), label: "Notificar"),
            BottomNavigationBarItem(
                icon: Icon(Icons.report_off), label: "Resolver"),
          ],
          currentIndex: _currentScreen,
          onTap: (int novoItem) {
            setState(() => _currentScreen = novoItem);
          },
          fixedColor: const Color(0xffA3AB78),
        ));
  }
}
