import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monba_ft/bloc/bathroom_monitor_bloc.dart';
import 'package:monba_ft/bloc/bathroom_monitor_event.dart';
import 'package:monba_ft/enum/notificarEnum.dart';
import 'package:monba_ft/enum/resolverEnum.dart';
import 'package:monba_ft/enum/statusEnum.dart';
import 'package:monba_ft/model/notification.dart';
import 'package:monba_ft/provider/firestore_provider.dart';

import '../model/banheiro.dart';
import 'form_notificar.dart';

class BanheiroNotificarScreen extends StatefulWidget {
  Banheiro bath;
  BanheiroNotificarScreen(this.bath, {Key? key}) : super(key: key);

  @override
  State<BanheiroNotificarScreen> createState() =>
      _BanheiroNotificarScreenState();
}

class _BanheiroNotificarScreenState extends State<BanheiroNotificarScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Column(children: [
      Form(
        key: _formKey,
        child: Expanded(
          child: ListView(children: [
            Card(
                child: ListTile(
                    title: Text(widget.bath.getLocation),
                    leading: const Icon(Icons.location_on))),
            const Divider(),
            Card(
                child: ExpansionTile(
              maintainState: true,
              title: const Text('Status'),
              leading: const Icon(Icons.info),
              children: [
                Row(
                  children: [
                    Radio(
                      value: enm_status.totalmente,
                      groupValue: NotificarForm.statusRadio,
                      onChanged: (Enum? value) {
                        if (value != null) {
                          setState(() => NotificarForm.statusRadio = value);
                        }
                      },
                    ),
                    const Text("Interditado")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: enm_status.parcial,
                        groupValue: NotificarForm.statusRadio,
                        onChanged: (Enum? value) {
                          if (value != null) {
                            setState(() => NotificarForm.statusRadio = value);
                          }
                        }),
                    const Text("Parcialmente Interditado")
                  ],
                ),
              ],
            )),
            Card(
                child: ExpansionTile(
              title: const Text('Papel Higiênico'),
              leading: const Icon(Icons.receipt_long),
              children: [
                Row(
                  children: [
                    Radio(
                      value: enm_toiletPaper.emFalta,
                      groupValue: NotificarForm.papelHigienicoRadio,
                      onChanged: (Enum? value) {
                        if (value != null) {
                          setState(
                              () => NotificarForm.papelHigienicoRadio = value);
                        }
                      },
                    ),
                    const Text("Em falta")
                  ],
                ),
              ],
            )),
            Card(
                child: ExpansionTile(
              title: const Text('Papel Toalha'),
              leading: const Icon(Icons.dry_cleaning),
              children: [
                Row(
                  children: [
                    Radio(
                      value: enm_paperTowel.emFalta,
                      groupValue: NotificarForm.papelToalhaRadio,
                      onChanged: (Enum? value) {
                        if (value != null) {
                          setState(
                              () => NotificarForm.papelToalhaRadio = value);
                        }
                      },
                    ),
                    const Text("Em falta")
                  ],
                ),
              ],
            )),
            Card(
                child: ExpansionTile(
              title: const Text('Pias'),
              leading: const Icon(Icons.countertops),
              children: [
                Row(
                  children: [
                    Radio(
                      value: enm_fixedSink.alguma,
                      groupValue: NotificarForm.piaRadio,
                      onChanged: (Enum? value) {
                        if (value != null) {
                          setState(() => NotificarForm.piaRadio = value);
                        }
                      },
                    ),
                    const Text("Pias defeituosas")
                  ],
                ),
                if (NotificarForm.piaRadio == enm_fixedSink.alguma)
                  TextFormField(
                      onSaved: (value) {
                        if (value != null) {
                          NotificarForm.piasDefeituosas = int.parse(value);
                        }
                      },
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Quantas pias estão com defeito?',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.white),
                          )))
              ],
            )),
            Card(
                child: ExpansionTile(
              title: const Text('Sabonete'),
              leading: const Icon(Icons.soap),
              children: [
                Row(
                  children: [
                    Radio(
                      value: enm_soap.nao,
                      groupValue: NotificarForm.saboneteRadio,
                      onChanged: (Enum? value) {
                        if (value != null) {
                          setState(() => NotificarForm.saboneteRadio = value);
                        }
                      },
                    ),
                    const Text("Em falta")
                  ],
                ),
              ],
            )),
            Card(
                child: ExpansionTile(
              title: const Text('Privada'),
              leading: const Icon(Icons.event_seat),
              maintainState: true,
              children: [
                Row(
                  children: [
                    Radio(
                      value: enm_fixedToilet.alguma,
                      groupValue: NotificarForm.privadaRadio,
                      onChanged: (Enum? value) {
                        if (value != null) {
                          setState(() => NotificarForm.privadaRadio = value);
                        }
                      },
                    ),
                    const Text("Privadas defeituosas")
                  ],
                ),
                if (NotificarForm.privadaRadio == enm_fixedToilet.alguma)
                  TextFormField(
                      onSaved: (value) {
                        if (value != null) {
                          NotificarForm.privadasDefeituosas = int.parse(value);
                        }
                      },
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Quantas privadas estão com defeito?',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.white),
                          )))
              ],
            )),
          ]),
        ),
      ),
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 189, 224, 56),
            shadowColor: const Color.fromARGB(255, 0, 0, 0),
            minimumSize: const Size(180, 50),
            maximumSize: const Size(180, 50),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
            }
            Banheiro newBanheiro = widget.bath;

            newBanheiro.setBathStatus =
                NotificarForm.statusRadio != enm_status.nenhum
                    ? NotificarForm.statusRadio
                    : newBanheiro.getStatus;

            if (NotificarForm.papelHigienicoRadio != enm_toiletPaper.none) {
              newBanheiro.setBathToiletPaper = false;
            }

            if (NotificarForm.papelToalhaRadio != enm_paperTowel.none) {
              newBanheiro.setBathTowelPaper = false;
            }

            if (NotificarForm.piaRadio != enm_fixedSink.none) {
              newBanheiro.setBathDefectiveSink = true;
            }
            newBanheiro.setBathQuantityDefectiveSink =
                NotificarForm.piasDefeituosas != -1
                    ? NotificarForm.piasDefeituosas
                    : newBanheiro.getQuantityDefectiveSink;

            if (NotificarForm.privadaRadio != enm_fixedToilet.none) {
              newBanheiro.setBathDefectiveToilet = true;
            }
            newBanheiro.setBathQuantityDefectiveToilet =
                NotificarForm.privadasDefeituosas != -1
                    ? NotificarForm.privadasDefeituosas
                    : newBanheiro.getQuantityDefectiveToilet;

            if (NotificarForm.saboneteRadio != enm_soap.none) {
              newBanheiro.setBathSoap = false;
            }

            BathNotification notification = BathNotification(
              newBanheiro.getLocation,
              newBanheiro.getStatus,
              newBanheiro.getToiletPaper,
              newBanheiro.getTowelPaper,
              newBanheiro.getDefectiveSink,
              newBanheiro.getQuantityDefectiveSink,
              newBanheiro.getSoap,
              newBanheiro.getDefectiveToilet,
              newBanheiro.getQuantityDefectiveToilet,
            );
            notification.setNotificationDate = DateTime.now().toString();

            FirestoreServer.helper.updateBathroom(
                widget.bath.getUid,
                Banheiro.simple(
                  newBanheiro.getStatus,
                  newBanheiro.getToiletPaper,
                  newBanheiro.getTowelPaper,
                  newBanheiro.getDefectiveSink,
                  newBanheiro.getQuantityDefectiveSink,
                  newBanheiro.getSoap,
                  newBanheiro.getDefectiveToilet,
                  newBanheiro.getQuantityDefectiveToilet,
                ));

            FirestoreServer.helper.notify(notification);
            BlocProvider.of<BathroomMonitorBloc>(context).add(AskNewList());
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.green,
                duration: Duration(seconds: 1),
                content: Text("Notificação enviada com Sucesso!")));
            widget.bath = newBanheiro;
            clearSelection();
          },
          child: const Text(
            'Notificar Problema',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )),
    ]);
  }

  void clearSelection() {
    setState(() {
      NotificarForm.statusRadio = enm_status.nenhum;
      NotificarForm.papelHigienicoRadio = enm_toiletPaper.none;
      NotificarForm.papelToalhaRadio = enm_paperTowel.none;
      NotificarForm.piaRadio = enm_fixedSink.none;
      NotificarForm.saboneteRadio = enm_soap.none;
      NotificarForm.privadaRadio = enm_fixedToilet.none;

      NotificarForm.privadasDefeituosas = -1;
      NotificarForm.piasDefeituosas = -1;
    });
  }
}
