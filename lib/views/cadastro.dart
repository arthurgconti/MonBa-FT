import 'package:flutter/material.dart';
import 'package:monba_ft/views/home.dart';
import 'login.dart';

class CadastroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 189, 224, 56),
          centerTitle: true,
          title: Text(
            'MonBa-FT',
            style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 45,
            ),            
          )
      ),
      backgroundColor: Color.fromARGB(255, 223, 223, 223),
      body: Container(
        padding: const EdgeInsets.all(25),
        child: Center(
            child: Column(
          children: [
            const Text('Cadastro',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontStyle: FontStyle.italic,
              ),
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 18.0),
                    SizedBox(
                      width: 350,
                      height: 45,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Nome',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    SizedBox(
                      width: 350,
                      height: 45,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'RA',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    SizedBox(
                      width: 350,
                      height: 45,
                      child: 
                      TextFormField(
                        decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Email - Domínio UNICAMP',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    SizedBox(
                      width: 350,
                      height: 45,
                      child:
                        TextFormField(
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Celular',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    SizedBox(height: 12.0),
                    SizedBox(
                      width: 350,
                      height: 45,
                      child:
                        TextFormField(
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Usuário',
                            border: OutlineInputBorder(),
                          ),
                        ),
                    ),
                    SizedBox(height: 12.0),
                    SizedBox(
                      width: 350,
                      height: 45,
                      child:
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Senha',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    SizedBox(height: 12.0),
                    SizedBox(
                      width: 350,
                      height: 45,
                      child:
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Confirmar Senha',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    SizedBox(height: 12.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 189, 224, 56),
                        shadowColor: Color.fromARGB(255, 0, 0, 0),
                        minimumSize: const Size(200, 50),
                        maximumSize: const Size(200, 50),
                      ),
                      onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()))
                      },
                      child: const Text('Finalizar Cadastro',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        )),
      ),
    );
  }
}
