import 'package:flutter/material.dart';

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
      String image1, String image2, BuildContext context,
      {String nameBath1 = "", String nameBath2 = ""}) {
    return Row(children: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent, shadowColor: Colors.transparent),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BanheiroDetalhesScreen()));
          },
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      border: Border.all(color: Colors.black, width: 6)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(49),
                      child: Image.asset(
                        image1,
                        width: 200,
                        height: 200,
                      ))),
              Text(nameBath1)
            ],
          )),
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent, shadowColor: Colors.transparent),
          onPressed: () {},
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(55),
                    border: Border.all(color: Colors.black, width: 6)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(49),
                  child: Column(
                    children: [
                      Image.asset(
                        image2,
                        width: 200,
                        height: 200,
                      ),
                    ],
                  ),
                ),
              ),
              Text(nameBath2)
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
            title: Text(
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
            Row(
              children: [
                bathroomImagesButton('assets/images/banheiro.jpg',
                    'assets/images/banheiro.jpg', context,
                    nameBath1: 'PA', nameBath2: 'LP')
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Row(
              children: [
                bathroomImagesButton('assets/images/banheiro.jpg',
                    'assets/images/banheiro.jpg', context,
                    nameBath1: 'Bandeco', nameBath2: 'Biblioteca')
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        )));
  }
}
