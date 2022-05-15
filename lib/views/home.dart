import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monba_ft/bloc/bathroom_monitor_bloc.dart';
import 'package:monba_ft/bloc/bathroom_monitor_event.dart';
import 'package:monba_ft/model/banheiroBiblioteca.dart';
import 'package:monba_ft/model/banheiroPA.dart';
import 'package:monba_ft/provider/rest_provider.dart';

import '../bloc/bathroom_monitor_state.dart';
import '../model/banheiro.dart';
import '../model/banheiroBandeco.dart';
import '../model/banheiroLP.dart';
import '../model/banheiros.dart';
import 'banheiro_detalhes.dart';

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
    } else if (value == 2) {
      setState(() {
        _selected = 2;
      });
    } else {
      setState(() {
        _selected = 3;
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
                        width: 200,
                        height: 200,
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
                        width: 200,
                        height: 200,
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
  Widget build(BuildContext context) {
    return BlocBuilder<BathroomMonitorBloc, BathroomMonitorState>(
        builder: (context, state) {
      return mainMenu(state.bathrooms);
    });
  }

  Widget mainMenu(BathroomCollection bathrooms) {
    BanheiroPA _banheiroPA = BanheiroPA(
        bathrooms.bathroom(0).getStatus,
        bathrooms.bathroom(0).getToiletPaper,
        bathrooms.bathroom(0).getTowelPaper,
        bathrooms.bathroom(0).getDefectiveSink,
        bathrooms.bathroom(0).getQuantityDefectiveSink,
        bathrooms.bathroom(0).getSoap,
        bathrooms.bathroom(0).getDefectiveToilet,
        bathrooms.bathroom(0).getQuantityDefectiveToilet);
    BanheiroLP _banheiroLP = BanheiroLP(
        bathrooms.bathroom(1).getStatus,
        bathrooms.bathroom(1).getToiletPaper,
        bathrooms.bathroom(1).getTowelPaper,
        bathrooms.bathroom(1).getDefectiveSink,
        bathrooms.bathroom(1).getQuantityDefectiveSink,
        bathrooms.bathroom(1).getSoap,
        bathrooms.bathroom(1).getDefectiveToilet,
        bathrooms.bathroom(1).getQuantityDefectiveToilet);

    BanheiroBandeco _banheiroBandeco = BanheiroBandeco(
        bathrooms.bathroom(2).getStatus,
        bathrooms.bathroom(2).getToiletPaper,
        bathrooms.bathroom(2).getTowelPaper,
        bathrooms.bathroom(2).getDefectiveSink,
        bathrooms.bathroom(2).getQuantityDefectiveSink,
        bathrooms.bathroom(2).getSoap,
        bathrooms.bathroom(2).getDefectiveToilet,
        bathrooms.bathroom(2).getQuantityDefectiveToilet);

    BanheiroBiblioteca _banheiroBiblioteca = BanheiroBiblioteca(
        bathrooms.bathroom(3).getStatus,
        bathrooms.bathroom(3).getToiletPaper,
        bathrooms.bathroom(3).getTowelPaper,
        bathrooms.bathroom(3).getDefectiveSink,
        bathrooms.bathroom(3).getQuantityDefectiveSink,
        bathrooms.bathroom(3).getSoap,
        bathrooms.bathroom(3).getDefectiveToilet,
        bathrooms.bathroom(3).getQuantityDefectiveToilet);

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 189, 224, 56),
            centerTitle: true,
            title: const Text(
              'MonBa-FT  |  HOME',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 32,
              ),
            )),
        backgroundColor: Color.fromARGB(255, 223, 223, 223),
        body: Container(
            child: Column(
          children: [
            SizedBox(height: 25.0),
            const Text(
              'Banheiros',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 25.0),
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
                customRadioButton(
                    3, const Icon(Icons.woman, color: Colors.white)),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            SizedBox(height: 25.0),
            Row(
              children: [
                bathroomImagesButton(context,
                    leftBathroom: _banheiroPA, rightBathroom: _banheiroLP)
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Row(
              children: [
                bathroomImagesButton(context,
                    leftBathroom: _banheiroBandeco,
                    rightBathroom: _banheiroBiblioteca)
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        )));
  }
}
