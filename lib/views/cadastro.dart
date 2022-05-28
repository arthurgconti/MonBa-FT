import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monba_ft/bloc/auth_event.dart';
import 'package:monba_ft/bloc/user_bloc.dart';
import 'package:monba_ft/bloc/user_event.dart';
import 'package:monba_ft/views/home.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/user_state.dart';
import '../model/usuario.dart';
import 'login.dart';

class CadastroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    User user = User("", "", "", "", "", "");

    return BlocProvider(
        create: (_) => UserBloc(),
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Color.fromARGB(255, 189, 224, 56),
                centerTitle: true,
                title: const Text(
                  'MonBa-FT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 45,
                  ),
                )),
            backgroundColor: Color.fromARGB(255, 223, 223, 223),
            body: Container(
              padding: const EdgeInsets.all(25),
              child: Center(
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    const Text(
                      'Cadastro',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                      return Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 18.0),
                              SizedBox(
                                width: 350,
                                height: 45,
                                child: TextFormField(
                                  initialValue: user.getName,
                                  validator: (value) {
                                    if (value!.isEmpty)
                                      return "Campo não pode estar vazio";
                                    else
                                      return null;
                                  },
                                  onSaved: (value) {
                                    user.setName = value!;
                                  },
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
                                  initialValue: user.getRa,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Campo não pode estar vazio";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) {
                                    user.setRa = value!;
                                  },
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
                                child: TextFormField(
                                  initialValue: user.getEmail,
                                  validator: (value) {
                                    RegExp regex = RegExp(
                                        r'[a-z0-9]+\@?(dac\.)?(unicamp\.br)');
                                    if (value!.isEmpty) {
                                      return "Campo não pode estar vazio";
                                    }
                                    if (!regex.hasMatch(value)) {
                                      return "Email precisa ser da unicamp";
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    user.setEmail = value!;
                                  },
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    labelText: 'Email - Domínio UNICAMP',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12.0),
                              SizedBox(
                                width: 350,
                                height: 45,
                                child: TextFormField(
                                  initialValue: user.getCellphone,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Campo não pode estar vazio";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) {
                                    user.setCellphone = value!;
                                  },
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    labelText: 'Celular',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12.0),
                              SizedBox(
                                width: 350,
                                height: 45,
                                child: TextFormField(
                                  initialValue: user.getUsername,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Campo não pode estar vazio";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) {
                                    user.setUsername = value!;
                                  },
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    labelText: 'Usuário',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12.0),
                              SizedBox(
                                width: 350,
                                height: 45,
                                child: TextFormField(
                                  initialValue: user.getPassword,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Campo não pode estar vazio";
                                    }
                                    if (value.length < 6) {
                                      return "Campo precisa ter ao menos 6 caracteres";
                                    }
                                    user.setPassword = value;
                                    return null;
                                  },
                                  onSaved: (value) {},
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    labelText: 'Senha',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12.0),
                              SizedBox(
                                width: 350,
                                height: 45,
                                child: TextFormField(
                                  initialValue: "",
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Campo não pode estar vazio";
                                    }
                                    if (value != user.getPassword) {
                                      return "Senhas não coincidem";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (value) {},
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    labelText: 'Confirmar Senha',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12.0),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromARGB(255, 189, 224, 56),
                                  shadowColor:
                                      const Color.fromARGB(255, 0, 0, 0),
                                  minimumSize: const Size(200, 50),
                                  maximumSize: const Size(200, 50),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    BlocProvider.of<UserBloc>(context)
                                        .add(SubmitUserEvent(user: user));
                                    BlocProvider.of<AuthBloc>(context).add(
                                        RegisterUser(
                                            email: user.getEmail,
                                            password: user.getPassword));
                                    _formKey.currentState!.reset();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.green,
                                            duration: Duration(seconds: 1),
                                            content: Text(
                                                "Cadastro realizado com Sucesso!")));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LoginScreen()));
                                  }
                                },
                                child: const Text(
                                  'Finalizar Cadastro',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ));
                    })
                  ],
                )),
              ),
            )));
  }
}
