import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monba_ft/views/home.dart';

import 'cadastro.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 223, 223),
      body: Container(
        padding: const EdgeInsets.all(35),
        child: Center(
            child: Column(
          children: [
            const Text('MonBa-FT', 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 80,
              )
            ),
            const Text('Seja bem-vindo',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 45.0),
                    SizedBox(
                      width: 350,
                      child:
                        TextFormField(
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                              labelText: 'Usuário', border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Colors.white),
                              
                              )
                          ),
                        ),
                    ),  
                    SizedBox(height: 25.0),
                    SizedBox(
                      width: 350,
                      child:
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                              labelText: 'Senha', 
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide: BorderSide(color: Colors.white),
                              )
                          ),
                        ),
                    ),
                    SizedBox(height: 45.0),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 189, 224, 56),
                          shadowColor: Color.fromARGB(255, 0, 0, 0),
                          minimumSize: const Size(180, 50),
                          maximumSize: const Size(180, 50),
                        ),
                        onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeScreen()))
                            },
                        child: const Text('Conectar-se',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                        ),
                    SizedBox(height: 12.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 255, 255, 255),
                          shadowColor: Color.fromARGB(255, 0, 0, 0),
                          side: BorderSide(color: Color.fromARGB(255, 189, 224, 56), width: 2),
                          minimumSize: const Size(180, 50),
                          maximumSize: const Size(180, 50),
                        ),
                        onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CadastroScreen()))
                            },
                        child: const Text('Cadastrar-se',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),
                        )
                        ),
                  ],
                ))
          ],
        )),
      ),
    );
  }
}
