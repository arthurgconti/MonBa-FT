import 'package:flutter/material.dart';
import 'package:monba_ft/enum/statusEnum.dart';
import 'package:monba_ft/views/banheiro_notificar.dart';
import 'package:monba_ft/views/banheiro_resolver.dart';

class BanheiroDetalhesScreen extends StatefulWidget {
  var bathroom;
  BanheiroDetalhesScreen(this.bathroom, {Key? key});

  @override
  State<BanheiroDetalhesScreen> createState() => _BanheiroDetalhesScreenState();
}

class _BanheiroDetalhesScreenState extends State<BanheiroDetalhesScreen> {
  var _currentScreen = 0;

  Widget banheiroDetalhes() {
    return Row(children: [
      Container(
          margin: const EdgeInsets.only(right: 10, left: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              border: Border.all(
                  color: Color.fromARGB(255, 189, 224, 56), width: 3.5)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                widget.bathroom.getImagePath,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ))),
      Expanded(
          child: ListView(
        padding: const EdgeInsets.only(top: 30),
        children: <Widget>[
          Card(
              child: ListTile(
                  title: Text(widget.bathroom.getLocation),
                  leading: const Icon(Icons.location_on))),
          Card(
              child: ListTile(
                  title: Text(widget.bathroom.getStrStatus),
                  leading: Icon(
                    Icons.info,
                    color: widget.bathroom.getStatus == enm_status.totalmente
                        ? (Colors.redAccent)
                        : (widget.bathroom.getStatus == enm_status.parcial
                            ? Colors.amber
                            : Colors.lightGreen),
                  ))),
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
              ListTile(
                title: Text('Quantidade: ${widget.bathroom.getSinkQuantity}'),
              ),
              ListTile(
                title: const Text('Pia defeituosa'),
                trailing: Icon(
                  widget.bathroom.getDefectiveSink
                      ? Icons.task_alt
                      : Icons.block,
                  color: widget.bathroom.getDefectiveSink
                      ? Colors.redAccent
                      : Colors.lightGreen,
                ),
              ),
              if (widget.bathroom.getDefectiveSink)
                ListTile(
                  title: Text(
                      'Quantidade de pias com defeito: ${widget.bathroom.getQuantityDefectiveSink}'),
                )
            ],
          )),
          Card(
              child: ExpansionTile(
            title: const Text('Sabonete'),
            leading: const Icon(Icons.soap),
            children: [
              ListTile(
                  title: Text(
                      'Quantidade de suportes: ${widget.bathroom.getQuantitySoapSupport}')),
              ListTile(
                title: const Text('Disponibilidade'),
                trailing: Icon(
                  widget.bathroom.getSoap ? Icons.task_alt : Icons.block,
                  color: widget.bathroom.getSoap
                      ? Colors.lightGreen
                      : Colors.redAccent,
                ),
              ),
            ],
          )),
          Card(
              child: ExpansionTile(
            title: const Text('Privada'),
            leading: const Icon(Icons.event_seat),
            children: [
              ListTile(
                title: Text('Quantidade: ${widget.bathroom.getToiletQuantity}'),
              ),
              ListTile(
                title: const Text('Privadas defeituosas'),
                trailing: Icon(
                  widget.bathroom.getDefectiveToilet
                      ? Icons.task_alt
                      : Icons.block,
                  color: widget.bathroom.getDefectiveToilet
                      ? Colors.redAccent
                      : Colors.lightGreen,
                ),
              ),
              if (widget.bathroom.getDefectiveToilet)
                ListTile(
                  title: Text(
                      'Quantidade de privadas com defeito: ${widget.bathroom.getQuantityDefectiveToilet}'),
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
        appBar:
            AppBar(backgroundColor: const Color.fromARGB(255, 189, 224, 56)),
        body: IndexedStack(index: _currentScreen, children: [
          banheiroDetalhes(),
          BanheiroNotificarScreen(widget.bathroom.getLocation),
          BanheiroResolverScreen(widget.bathroom.getLocation)
        ]),
        backgroundColor: Color.fromARGB(255, 223, 223, 223),
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
