import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monba_ft/bloc/auth_event.dart';
import 'package:monba_ft/views/home.dart';

import '../bloc/auth_bloc.dart';
import 'cadastro.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    String email = "", password = "";

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 223, 223),
      body: Container(
        padding: const EdgeInsets.all(35),
        child: Center(
            child: Column(
          children: [
            const Text('MonBa-FT',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 80,
                )),
            const Text(
              'Seja bem-vindo',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 45.0),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        validator: (String? inValue) {
                          RegExp regex =
                              RegExp(r'[a-z0-9]+\@?(dac\.)?(unicamp\.br)');
                          if (inValue!.isEmpty) {
                            return "Campo não pode estar vazio";
                          }
                          if (!regex.hasMatch(inValue)) {
                            return "Email precisa ser da unicamp";
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          email = value!;
                        },
                        decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.white),
                            )),
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    SizedBox(
                      width: 350,
                      child: TextFormField(
                        validator: (String? inValue) {
                          if (inValue!.length < 6) {
                            return "Tem que ter ao menos 6 caracters";
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          password = value!;
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Senha',
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: Colors.white),
                            )),
                      ),
                    ),
                    const SizedBox(height: 45.0),
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
                            BlocProvider.of<AuthBloc>(context).add(
                                LoginUser(email: email, password: password));
                          }
                        },
                        child: const Text(
                          'Conectar-se',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )),
                    const SizedBox(height: 12.0),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 255, 255, 255),
                          shadowColor: const Color.fromARGB(255, 0, 0, 0),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 189, 224, 56),
                              width: 2),
                          minimumSize: const Size(180, 50),
                          maximumSize: const Size(180, 50),
                        ),
                        onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CadastroScreen()))
                            },
                        child: const Text(
                          'Cadastrar-se',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        )),
                  ],
                ))
          ],
        )),
      ),
    );
  }
}
