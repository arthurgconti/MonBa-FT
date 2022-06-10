import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monba_ft/bloc/bathroom_bloc.dart';
import 'package:monba_ft/enum/statusEnum.dart';
import 'package:monba_ft/views/banheiro_notificar.dart';
import 'package:monba_ft/views/banheiro_resolver.dart';

import '../bloc/bathroom_monitor_bloc.dart';
import '../bloc/bathroom_monitor_state.dart';

class BanheiroDetalhesScreen extends StatefulWidget {
  var bathroom;
  BanheiroDetalhesScreen(this.bathroom, {Key? key});

  @override
  State<BanheiroDetalhesScreen> createState() => _BanheiroDetalhesScreenState();
}

class _BanheiroDetalhesScreenState extends State<BanheiroDetalhesScreen> {
  var _currentScreen = 0;

  Widget banheiroDetalhes() {
    return BlocBuilder<BathroomMonitorBloc, BathroomMonitorState>(
      builder: (context, state) {
        var bathroom = state.bathrooms
            .bathroom(state.bathrooms.getIndexOfId(widget.bathroom.getUid));
        return Row(children: [
          Container(),
          Expanded(
              child: ListView(
            padding: const EdgeInsets.only(top: 30),
            children: <Widget>[
              Card(
                  child: ListTile(
                      title: Text(bathroom.getLocation),
                      leading: const Icon(Icons.location_on))),
              Card(
                  child: ListTile(
                      title: Text(bathroom.getStrStatus),
                      leading: Icon(
                        Icons.info,
                        color: bathroom.getStatus == enm_status.totalmente
                            ? (Colors.redAccent)
                            : (bathroom.getStatus == enm_status.parcial
                                ? Colors.amber
                                : Colors.lightGreen),
                      ))),
              const Divider(),
              Card(
                  child: ListTile(
                title: const Text('Papel Higiênico'),
                leading: const Icon(Icons.receipt_long),
                trailing: Icon(
                  bathroom.getToiletPaper ? Icons.task_alt : Icons.block,
                  color: bathroom.getToiletPaper
                      ? Colors.lightGreen
                      : Colors.redAccent,
                ),
              )),
              Card(
                  child: ListTile(
                title: const Text('Papel Toalha'),
                leading: const Icon(Icons.dry_cleaning),
                trailing: Icon(
                  bathroom.getTowelPaper ? Icons.task_alt : Icons.block,
                  color: bathroom.getTowelPaper == true
                      ? Colors.lightGreen
                      : Colors.redAccent,
                ),
              )),
              const Divider(),
              Card(
                  child: ExpansionTile(
                title: const Text('Pia'),
                leading: const Icon(Icons.countertops),
                children: [
                  ListTile(
                    title: Text('Quantidade: ${bathroom.getSinkQuantity}'),
                  ),
                  ListTile(
                    title: const Text('Pia defeituosa'),
                    trailing: Icon(
                      bathroom.getDefectiveSink ? Icons.task_alt : Icons.block,
                      color: bathroom.getDefectiveSink
                          ? Colors.redAccent
                          : Colors.lightGreen,
                    ),
                  ),
                  if (bathroom.getDefectiveSink)
                    ListTile(
                      title: Text(
                          'Quantidade de pias com defeito: ${bathroom.getQuantityDefectiveSink}'),
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
                          'Quantidade de suportes: ${bathroom.getQuantitySoapSupport}')),
                  ListTile(
                    title: const Text('Disponibilidade'),
                    trailing: Icon(
                      bathroom.getSoap ? Icons.task_alt : Icons.block,
                      color: bathroom.getSoap
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
                    title: Text('Quantidade: ${bathroom.getToiletQuantity}'),
                  ),
                  ListTile(
                    title: const Text('Privadas defeituosas'),
                    trailing: Icon(
                      bathroom.getDefectiveToilet
                          ? Icons.task_alt
                          : Icons.block,
                      color: bathroom.getDefectiveToilet
                          ? Colors.redAccent
                          : Colors.lightGreen,
                    ),
                  ),
                  if (bathroom.getDefectiveToilet)
                    ListTile(
                      title: Text(
                          'Quantidade de privadas com defeito: ${bathroom.getQuantityDefectiveToilet}'),
                    )
                ],
              ))
            ],
          ))
        ]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(backgroundColor: const Color.fromARGB(255, 189, 224, 56)),
        body: IndexedStack(index: _currentScreen, children: [
          banheiroDetalhes(),
          BanheiroNotificarScreen(widget.bathroom),
          BanheiroResolverScreen(widget.bathroom)
        ]),
        backgroundColor: const Color.fromARGB(255, 223, 223, 223),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.feed), label: "Detalhes"),
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
