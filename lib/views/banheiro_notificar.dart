import 'package:flutter/material.dart';

import 'form_notificar.dart';

class BanheiroNotificarScreen extends StatefulWidget {
  const BanheiroNotificarScreen({Key? key}) : super(key: key);

  @override
  State<BanheiroNotificarScreen> createState() =>
      _BanheiroNotificarScreenState();
}

class _BanheiroNotificarScreenState extends State<BanheiroNotificarScreen> {
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
                      value: true,
                      groupValue: formNotificar.papelToalhaRadio,
                      onChanged: (value) {},
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
                      value: true,
                      groupValue: formNotificar.piaRadio,
                      onChanged: (value) {},
                    ),
                    const Text("Pias defeituosas")
                  ],
                ),
                TextFormField(
                    decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Quantas pias estão com defeito?',
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
                    const Text("Em falta")
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
                    const Text("Privadas defeituosas")
                  ],
                ),
                TextFormField(
                    decoration: const InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Quantas privadas estão com defeito?',
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
                content: Text("Notificação enviada com Sucesso!")));
          },
          child: const Text(
            'Notificar problema',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )),
    ]);
  }
}
