import 'package:flutter/material.dart';

class BanheiroDetalhesScreen extends StatefulWidget {
  const BanheiroDetalhesScreen({Key? key}) : super(key: key);

  @override
  State<BanheiroDetalhesScreen> createState() => _BanheiroDetalhesScreenState();
}

class _BanheiroDetalhesScreenState extends State<BanheiroDetalhesScreen> {
  var _currentScreen = 0;
  var _piaDefeituosa = true;
  var _privadaDefeituosa = false;

  Widget banheiroDetalhes() {
    return Row(children: [
      Container(
          margin: const EdgeInsets.only(right: 10, left: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              border: Border.all(color: Colors.black54, width: 1.5)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Image.asset(
                'assets/images/banheiro.jpg',
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ))),
      Expanded(
          child: ListView(
        padding: const EdgeInsets.only(top: 30),
        children: <Widget>[
          const Card(
              child: ListTile(
                  title: Text('PA'), leading: Icon(Icons.location_on))),
          const Card(
              child: ListTile(
                  title: Text('Interditado'), leading: Icon(Icons.info))),
          const Divider(),
          const Card(
              child: ListTile(
            title: Text('Papel Higiênico'),
            leading: Icon(Icons.receipt_long),
            trailing: Icon(
              Icons.block,
              color: Colors.redAccent,
            ),
          )),
          const Card(
              child: ListTile(
            title: Text('Papel Toalha'),
            leading: Icon(Icons.dry_cleaning),
            trailing: Icon(
              Icons.task_alt,
              color: Colors.lightGreen,
            ),
          )),
          const Divider(),
          Card(
              child: ExpansionTile(
            title: const Text('Pia'),
            leading: const Icon(Icons.countertops),
            children: [
              const ListTile(
                title: Text('Quantidade: 2'),
              ),
              ListTile(
                title: const Text('Pia defeituosa'),
                trailing: Icon(
                  _piaDefeituosa ? Icons.task_alt : Icons.block,
                  color: _piaDefeituosa ? Colors.redAccent : Colors.lightGreen,
                ),
              ),
              if (_piaDefeituosa)
                const ListTile(
                  title: Text('Quantidade de pias com defeito: 1'),
                )
            ],
          )),
          const Card(
              child: ExpansionTile(
            title: Text('Sabonete'),
            leading: Icon(Icons.soap),
            children: [
              ListTile(title: Text('Quantidade: 2')),
              ListTile(
                title: Text('Disponibilidade'),
                trailing: Icon(
                  Icons.block,
                  color: Colors.redAccent,
                ),
              ),
            ],
          )),
          Card(
              child: ExpansionTile(
            title: const Text('Privada'),
            leading: const Icon(Icons.event_seat),
            children: [
              const ListTile(
                title: Text('Quantidade: 2'),
              ),
              ListTile(
                title: const Text('Privadas defeituosas'),
                trailing: Icon(
                  _privadaDefeituosa ? Icons.task_alt : Icons.block,
                  color:
                      _privadaDefeituosa ? Colors.redAccent : Colors.lightGreen,
                ),
              ),
              if (_privadaDefeituosa)
                const ListTile(
                  title: Text('Quantidade de privadas com defeito: 1'),
                )
            ],
          ))
        ],
      ))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: const Color(0xff818274)),
        body:
            IndexedStack(index: _currentScreen, children: [banheiroDetalhes()]),
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
