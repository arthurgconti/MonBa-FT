import 'package:flutter/material.dart';

import 'form_notificar.dart';

class BanheiroResolverScreen extends StatefulWidget {
  const BanheiroResolverScreen({Key? key}) : super(key: key);

  @override
  State<BanheiroResolverScreen> createState() =>
      _BanheiroNotificarScreenState();
}

class _BanheiroNotificarScreenState extends State<BanheiroResolverScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    NotificarForm formNotificar = NotificarForm();
    return Column(children: [
      Form(
        key: _formKey,
        child: Expanded(
          child: ListView(children: [
            const Card(
                child: ListTile(
                    title: Text('PA'), leading: Icon(Icons.location_on))),
            const Divider(),
            Card(
                child: ExpansionTile(
              title: const Text('Status'),
              leading: const Icon(Icons.info),
              children: [
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: formNotificar.statusRadio,
                      onChanged: (value) {},
                    ),
                    const Text("Banheiro Livre")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: formNotificar.statusRadio,
                      onChanged: (value) {},
                    ),
                    const Text("Interditado")
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: "Parcialmente Interditado",
                        groupValue: formNotificar.statusRadio,
                        onChanged: (value) {}),
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
                      value: true,
                      groupValue: formNotificar.papelHigienicoRadio,
                      onChanged: (value) {},
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
                      value: true,
                      groupValue: formNotificar.papelToalhaRadio,
                      onChanged: (value) {},
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
                      value: true,
                      groupValue: formNotificar.piaRadio,
                      onChanged: (value) {},
                    ),
                    const Text("Pias consertadas")
                  ],
                ),
                TextFormField(
                    decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Quantas pias foram consertadas?',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                      groupValue: formNotificar.saboneteRadio,
                      onChanged: (value) {},
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
                      value: true,
                      groupValue: formNotificar.privadaRadio,
                      onChanged: (value) {},
                    ),
                    const Text("Privadas Consertadas")
                  ],
                ),
                TextFormField(
                    decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Quantas privadas foram consertadas?',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
}
