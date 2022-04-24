import 'package:flutter/material.dart';
import 'package:monba_ft/views/home.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        child: Center(
            child: Column(
          children: [
            Text('MonBa-FT'),
            Text('Seja bem-vindo'),
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Usuário', border: OutlineInputBorder()),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'Senha', border: OutlineInputBorder()),
                    ),
                    ElevatedButton(
                        onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()))
                            },
                        child: const Text('logado'))
                  ],
                ))
          ],
        )),
      ),
    );
  }
}
