import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monba_ft/bloc/user_event.dart';
import 'package:monba_ft/model/usuario.dart';

import '../bloc/user_bloc.dart';
import '../bloc/user_state.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  User currentUser = User("", "", "", "", "", "");

  @override
  build(BuildContext context) {
    return BlocProvider(
        create: (_) => UserBloc()..add(InitUserEvent()),
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 189, 224, 56),
                centerTitle: true,
                title: const Text(
                  'Perfil',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 45,
                  ),
                )),
            backgroundColor: const Color.fromARGB(255, 223, 223, 223),
            body: Container(
                padding: const EdgeInsets.all(25),
                child:
                    BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                  if (state is Loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return profile(state, context);
                  }
                }))));
  }

  profile(state, context) {
    return Form(
      key: _formKey,
      child: Center(
          child: SingleChildScrollView(
              child: Column(
        children: <Widget>[
          const SizedBox(height: 20.0),
          SizedBox(
            width: 350,
            height: 45,
            child: TextFormField(
              initialValue: state.currentUser.getName,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Campo não pode estar vazio";
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                currentUser.setName = value!;
              },
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          SizedBox(
            width: 350,
            height: 45,
            child: TextFormField(
              enabled: false,
              initialValue: state.currentUser.getRa,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Campo não pode estar vazio";
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                currentUser.setRa = value!;
              },
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'RA',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          SizedBox(
            width: 350,
            height: 45,
            child: TextFormField(
              enabled: false,
              initialValue: state.currentUser.getEmail,
              validator: (value) {
                RegExp regex = RegExp(r'[a-z0-9]+\@?(dac\.)?(unicamp\.br)');
                if (value!.isEmpty) {
                  return "Campo não pode estar vazio";
                }
                if (!regex.hasMatch(value)) {
                  return "Email precisa ser da unicamp";
                }
                return null;
              },
              onSaved: (value) {
                currentUser.setEmail = value!;
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
              initialValue: state.currentUser.getCellphone,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Campo não pode estar vazio";
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                currentUser.setCellphone = value!;
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
              initialValue: state.currentUser.getUsername,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Campo não pode estar vazio";
                } else {
                  return null;
                }
              },
              onSaved: (value) {
                currentUser.setUsername = value!;
              },
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'Usuário',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 26.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 189, 224, 56),
              shadowColor: const Color.fromARGB(255, 0, 0, 0),
              minimumSize: const Size(200, 50),
              maximumSize: const Size(200, 50),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                BlocProvider.of<UserBloc>(context)
                    .add(UpdateUserEvent(user: currentUser));
                BlocProvider.of<UserBloc>(context)
                    .add(SubmitUserEvent(user: currentUser));
                _formKey.currentState!.reset();
              }
            },
            child: const Text(
              'Atualizar Perfil',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          )
        ],
      ))),
    );
  }
}
