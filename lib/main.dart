import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monba_ft/bloc/bathroom_bloc.dart';
import 'package:monba_ft/bloc/bathroom_monitor_bloc.dart';
import 'package:monba_ft/provider/rest_provider.dart';
import 'package:monba_ft/views/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RestServer.helper.insertBathroom();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BathroomBloc()),
        BlocProvider(create: (_) => BathroomMonitorBloc()),
      ],
      child: MaterialApp(
          title: 'MonBa-FT',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginScreen()),
    );
  }
}
