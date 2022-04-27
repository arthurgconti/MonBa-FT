import 'package:flutter/material.dart';
import 'package:monba_ft/views/home.dart';
import 'login.dart';

class CadastroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(35),
        child: Center(
            child: Column(
          children: [
            const Text('MonBa-FT'),
            const Text('Cadastro'),
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 25.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'RA',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Email - Domínio UNICAMP',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Celular',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Usuário',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Confirmar Senha',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    ElevatedButton(
                      onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()))
                      },
                      child: const Text('Finalizar Cadastro'),
                    ),
                  ],
                ))
          ],
        )),
      ),
    );
  }
}
