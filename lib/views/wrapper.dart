import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monba_ft/bloc/auth_bloc.dart';
import 'package:monba_ft/bloc/auth_state.dart';
import 'package:monba_ft/bloc/bathroom_monitor_bloc.dart';
import 'package:monba_ft/bloc/bathroom_monitor_event.dart';
import 'package:monba_ft/bloc/bathroom_monitor_state.dart';
import 'package:monba_ft/views/home.dart';
import 'package:monba_ft/views/login.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Erro no Firebase"),
                  content: Text(state.message),
                );
              });
        }
      },
      builder: (context, state) {
        print(state);
        if (state is Authenticated) {
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
