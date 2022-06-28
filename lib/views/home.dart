import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monba_ft/bloc/bathroom_monitor_bloc.dart';
import 'package:monba_ft/enum/statusEnum.dart';
import 'package:monba_ft/model/banheiroBiblioteca.dart';
import 'package:monba_ft/model/banheiroPA.dart';
import 'package:monba_ft/bloc/auth_event.dart';
import 'package:monba_ft/provider/firestore_provider.dart';
import 'package:monba_ft/views/perfil.dart';

import '../bloc/auth_bloc.dart';
import '../bloc/bathroom_monitor_state.dart';
import '../model/banheiro.dart';
import '../model/banheiroBandeco.dart';
import '../model/banheiroLP.dart';
import '../model/banheiros.dart';
import 'banheiro_detalhes.dart';
import 'login.dart';
import 'navigation_drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selected = 1;
  void setSelected({int value = 1}) {
    if (value == 1) {
      setState(() {
        _selected = 1;
      });
    } else {
      setState(() {
        _selected = 2;
      });
    }
  }

  int getSelected() {
    return _selected;
  }

  Widget bathroomImagesButton(
    BuildContext context, {
    required Banheiro leftBathroom,
    required Banheiro rightBathroom,
  }) {
    return Row(children: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent, shadowColor: Colors.transparent),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        BanheiroDetalhesScreen(leftBathroom)));
          },
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      border: Border.all(
                          color: const Color.fromARGB(255, 189, 224, 56),
                          width: 6)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(49),
                      child: Image.asset(
                        leftBathroom.getImagePath,
                        width: 130,
                        height: 170,
                        fit: BoxFit.cover,
                      ))),
              Text(leftBathroom.getLocation,
                  style: const TextStyle(color: Colors.black))
            ],
          )),
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent, shadowColor: Colors.transparent),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        BanheiroDetalhesScreen(rightBathroom)));
          },
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(55),
                    border: Border.all(
                        color: Color.fromARGB(255, 189, 224, 56), width: 6)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(49),
                  child: Column(
                    children: [
                      Image.asset(
                        rightBathroom.getImagePath,
                        width: 130,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
              Text(rightBathroom.getLocation,
                  style: const TextStyle(color: Colors.black))
            ],
          ))
    ]);
  }

  Widget customRadioButton(int index, Icon icon) {
    return OutlinedButton(
        onPressed: () {
          setSelected(value: index);
        },
        child: icon,
        style: OutlinedButton.styleFrom(
          shape: const CircleBorder(side: BorderSide.none),
          backgroundColor: index == getSelected()
              ? const Color(0xffA3AB78)
              : const Color(0xff10454F),
        ));
  }

  @override
  build(BuildContext context) {
    return BlocBuilder<BathroomMonitorBloc, BathroomMonitorState>(
        builder: (context, state) {
      if (state is Loading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return mainMenu(state.bathrooms);
      }
    });
  }

  mainMenu(BathroomCollection bathrooms) {
    BanheiroPA _banheiroPA;
    BanheiroLP _banheiroLP;
    BanheiroBandeco _banheiroBandeco;
    BanheiroBiblioteca _banheiroBiblioteca;

    try {
      _banheiroPA = BanheiroPA(
          bathrooms.bathroom(0).getStatus,
          bathrooms.bathroom(0).getToiletPaper,
          bathrooms.bathroom(0).getTowelPaper,
          bathrooms.bathroom(0).getDefectiveSink,
          bathrooms.bathroom(0).getQuantityDefectiveSink,
          bathrooms.bathroom(0).getSoap,
          bathrooms.bathroom(0).getDefectiveToilet,
          bathrooms.bathroom(0).getQuantityDefectiveToilet);
      _banheiroPA.setUid = bathrooms.getIdAtIndex(0);

      _banheiroBandeco = BanheiroBandeco(
          bathrooms.bathroom(1).getStatus,
          bathrooms.bathroom(1).getToiletPaper,
          bathrooms.bathroom(1).getTowelPaper,
          bathrooms.bathroom(1).getDefectiveSink,
          bathrooms.bathroom(1).getQuantityDefectiveSink,
          bathrooms.bathroom(1).getSoap,
          bathrooms.bathroom(1).getDefectiveToilet,
          bathrooms.bathroom(1).getQuantityDefectiveToilet);

      _banheiroBandeco.setUid = bathrooms.getIdAtIndex(1);

      _banheiroLP = BanheiroLP(
          bathrooms.bathroom(2).getStatus,
          bathrooms.bathroom(2).getToiletPaper,
          bathrooms.bathroom(2).getTowelPaper,
          bathrooms.bathroom(2).getDefectiveSink,
          bathrooms.bathroom(2).getQuantityDefectiveSink,
          bathrooms.bathroom(2).getSoap,
          bathrooms.bathroom(2).getDefectiveToilet,
          bathrooms.bathroom(2).getQuantityDefectiveToilet);
      _banheiroLP.setUid = bathrooms.getIdAtIndex(2);

      _banheiroBiblioteca = BanheiroBiblioteca(
          bathrooms.bathroom(3).getStatus,
          bathrooms.bathroom(3).getToiletPaper,
          bathrooms.bathroom(3).getTowelPaper,
          bathrooms.bathroom(3).getDefectiveSink,
          bathrooms.bathroom(3).getQuantityDefectiveSink,
          bathrooms.bathroom(3).getSoap,
          bathrooms.bathroom(3).getDefectiveToilet,
          bathrooms.bathroom(3).getQuantityDefectiveToilet);
      _banheiroBiblioteca.setUid = bathrooms.getIdAtIndex(3);
    } catch (err) {
      _banheiroPA =
          BanheiroPA(enm_status.parcial, true, true, false, 0, true, false, 0);
      _banheiroLP = BanheiroLP(
          enm_status.naoInterditado, true, true, false, 0, true, false, 0);
      _banheiroBandeco = BanheiroBandeco(
          enm_status.totalmente, true, true, false, 0, true, false, 0);
      _banheiroBiblioteca = BanheiroBiblioteca(
          enm_status.naoInterditado, true, true, false, 0, true, false, 0);
    }

    return Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 189, 224, 56),
            centerTitle: true,
            title: const Text(
              'MonBa-FT',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 32,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.account_circle_rounded),
                tooltip: 'Profile',
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()))
                },
              ),
            ]),
        backgroundColor: Color.fromARGB(255, 223, 223, 223),
        body: Container(
          child: Column(
            children: [
              const SizedBox(height: 15.0),
              const Text(
                'Banheiros',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 15.0),
              Row(
                children: [
                  customRadioButton(
                      1,
                      const Icon(
                        Icons.man,
                        color: Colors.white,
                      )),
                  customRadioButton(
                      2, const Icon(Icons.accessible, color: Colors.white)),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              const SizedBox(height: 25.0),
              if (getSelected() != 2)
                Row(
                  children: [
                    bathroomImagesButton(context,
                        leftBathroom: _banheiroPA, rightBathroom: _banheiroLP)
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              if (getSelected() == 2)
                Row(
                  children: [
                    bathroomImagesButton(context,
                        leftBathroom: _banheiroBandeco,
                        rightBathroom: _banheiroLP)
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              if (getSelected() != 2)
                Row(
                  children: [
                    bathroomImagesButton(context,
                        leftBathroom: _banheiroBandeco,
                        rightBathroom: _banheiroBiblioteca)
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 189, 224, 56),
                        shadowColor: const Color.fromARGB(255, 0, 0, 0),
                        minimumSize: const Size(115, 40),
                        maximumSize: const Size(115, 40),
                      ),
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(Logout());
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        'Sair',
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ))
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
        ));
  }
}
