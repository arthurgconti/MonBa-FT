import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monba_ft/bloc/auth_bloc.dart';
import 'package:monba_ft/bloc/bathroom_bloc.dart';
import 'package:monba_ft/bloc/bathroom_monitor_bloc.dart';
import 'package:monba_ft/provider/firestore_provider.dart';
import 'package:monba_ft/views/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirestoreServer.helper.insertBathroom();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BathroomBloc()),
        BlocProvider(create: (_) => BathroomMonitorBloc()),
        BlocProvider(create: (_) => AuthBloc())
      ],
      child: MaterialApp(
          title: 'MonBa-FT',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Wrapper()),
    );
  }
}
