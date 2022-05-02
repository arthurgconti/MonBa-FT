import 'package:flutter/material.dart';
import 'package:monba_ft/enum/notificarEnum.dart';
import 'package:monba_ft/enum/resolverEnum.dart';
import 'package:monba_ft/enum/statusEnum.dart';
import 'package:monba_ft/views/form_resolver.dart';

import 'form_notificar.dart';

class BanheiroResolverScreen extends StatefulWidget {
  String bathroomLocation;
  BanheiroResolverScreen(this.bathroomLocation, {Key? key}) : super(key: key);

  @override
  State<BanheiroResolverScreen> createState() =>
      _BanheiroNotificarScreenState();
}

class _BanheiroNotificarScreenState extends State<BanheiroResolverScreen> {
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
                    title: Text(widget.bathroomLocation),
                    leading: const Icon(Icons.location_on))),
            const Divider(),
            Card(
                child: ExpansionTile(
              title: const Text('Status'),
              leading: const Icon(Icons.info),
              children: [
                Row(
                  children: [
                    Radio(
                      value: enm_status.naoInterditado,
                      groupValue: ResolveForm.statusRadio,
                      onChanged: (Enum? value) {
                        if (value != null) {
                          setState(() => ResolveForm.statusRadio = value);
                        }
                      },
                    ),
                    const Text("Banheiro não interditado")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: enm_status.parcial,
                        groupValue: ResolveForm.statusRadio,
                        onChanged: (Enum? value) {
                          if (value != null) {
                            setState(() => ResolveForm.statusRadio = value);
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
                      value: enm_toiletPaper.disponivel,
                      groupValue: ResolveForm.papelHigienicoRadio,
                      onChanged: (Enum? value) {
                        if (value != null) {
                          setState(
                              () => ResolveForm.papelHigienicoRadio = value);
                        }
                      },
                    ),
                    const Text("Abastecido")
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
                      value: enm_paperTowel.disponivel,
                      groupValue: ResolveForm.papelToalhaRadio,
                      onChanged: (Enum? value) {
                        if (value != null) {
                          setState(() => ResolveForm.papelToalhaRadio = value);
                        }
                      },
                    ),
                    const Text("Abastecido")
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
                      value: enm_fixedSink.todos,
                      groupValue: ResolveForm.piaRadio,
                      onChanged: (Enum? value) {
                        if (value != null) {
                          setState(() => ResolveForm.piaRadio = value);
                        }
                      },
                    ),
                    const Text("Todas as pias consertadas")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: enm_fixedSink.alguma,
                      groupValue: ResolveForm.piaRadio,
                      onChanged: (Enum? value) {
                        if (value != null) {
                          setState(() => ResolveForm.piaRadio = value);
                        }
                      },
                    ),
                    const Text("Alguma pia consertada")
                  ],
                ),
                if (ResolveForm.piaRadio == enm_fixedSink.alguma)
                  TextFormField(
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Quantas pias foram consertadas?',
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
                      value: true,
                      groupValue: ResolveForm.saboneteRadio,
                      onChanged: (bool? value) {
                        if (value != null) {
                          setState(() => ResolveForm.saboneteRadio = value);
                        }
                      },
                    ),
                    const Text("Abastecido")
                  ],
                ),
              ],
            )),
            Card(
                child: ExpansionTile(
              title: const Text('Privada'),
              leading: const Icon(Icons.event_seat),
              children: [
                Row(
                  children: [
                    Radio(
                      value: enm_fixedToilet.todos,
                      groupValue: ResolveForm.privadaRadio,
                      onChanged: (Enum? value) {
                        if (value != null) {
                          setState(() => ResolveForm.privadaRadio = value);
                        }
                      },
                    ),
                    const Text("Todas as privadas Consertadas")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: enm_fixedToilet.alguma,
                      groupValue: ResolveForm.privadaRadio,
                      onChanged: (Enum? value) {
                        if (value != null) {
                          setState(() => ResolveForm.privadaRadio = value);
                        }
                      },
                    ),
                    const Text("Alguma privada consertada")
                  ],
                ),
                if (ResolveForm.privadaRadio == enm_fixedToilet.alguma)
                  TextFormField(
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Quantas privadas foram consertadas?',
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
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.green,
                duration: Duration(seconds: 1),
                content: Text("Problema Resolvido com Sucesso!")));
            clearSelection();
          },
          child: const Text(
            'Resolver Problema',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )),
    ]);
  }

  void clearSelection() {
    setState(() {
      ResolveForm.statusRadio = enm_status.nenhum;
      ResolveForm.papelHigienicoRadio = enm_toiletPaper.none;
      ResolveForm.papelToalhaRadio = enm_paperTowel.none;
      ResolveForm.piaRadio = enm_fixedSink.none;
      ResolveForm.privadaRadio = enm_fixedToilet.none;
      ResolveForm.saboneteRadio = false;

      ResolveForm.privadasDefeituosas = 0;
      ResolveForm.piasDefeituosas = 0;
    });
  }
}
