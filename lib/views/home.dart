import 'package:flutter/material.dart';
import 'package:monba_ft/enum/statusEnum.dart';
import 'package:monba_ft/model/banheiroBiblioteca.dart';
import 'package:monba_ft/model/banheiroPA.dart';

import '../model/banheiro.dart';
import '../model/banheiroBandeco.dart';
import '../model/banheiroLP.dart';
import 'banheiro_detalhes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BanheiroPA _banheiroPA =
      BanheiroPA(enm_status.parcial, true, true, false, 0, true, false, 0);
  final BanheiroLP _banheiroLP = BanheiroLP(
      enm_status.naoInterditado, true, true, false, 0, true, false, 0);

  final BanheiroBandeco _banheiroBandeco = BanheiroBandeco(
      enm_status.totalmente, true, true, false, 0, true, false, 0);

  final BanheiroBiblioteca _banheiroBiblioteca = BanheiroBiblioteca(
      enm_status.naoInterditado, true, true, false, 0, true, false, 0);

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
                        leftBathroom.imagePath,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ))),
              Text(leftBathroom.location,
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
                        rightBathroom.imagePath,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
              Text(rightBathroom.location,
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
