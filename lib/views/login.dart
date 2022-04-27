import 'package:flutter/material.dart';
import 'package:monba_ft/views/home.dart';

import 'cadastro.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(35),
        child: Center(
            child: Column(
          children: [
            const Text('MonBa-FT'),
            const Text('Seja bem-vindo'),
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 45.0),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: 'Usuário', border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 25.0),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          labelText: 'Senha', border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 45.0),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 50),
                          maximumSize: const Size(200, 50),
                        ),
                        onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeScreen()))
                            },
                        child: const Text('Conectar-se')),
                    SizedBox(height: 25.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          
                          minimumSize: const Size(200, 50),
                          maximumSize: const Size(200, 50),
                        ),
                        onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CadastroScreen()))
                            },
                        child: const Text('Cadastrar-se')),
                  ],
                ))
          ],
        )),
      ),
    );
  }
}
