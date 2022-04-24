import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selected = 0;
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

  Widget bathroomImagesButton(String image1, String image2,
      {String nameBath1 = "", String nameBath2 = ""}) {
    return Row(children: [
      Column(
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
      ),
      Column(
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
      )
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
        appBar: AppBar(backgroundColor: Color(0xff818274)),
        body: Container(
            child: Column(
          children: [
            const Text('Banheiros'),
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
                bathroomImagesButton(
                    'assets/images/banheiro.jpg', 'assets/images/banheiro.jpg',
                    nameBath1: 'PA', nameBath2: 'LP')
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Row(
              children: [
                bathroomImagesButton(
                    'assets/images/banheiro.jpg', 'assets/images/banheiro.jpg',
                    nameBath1: 'Bandeco', nameBath2: 'Biblioteca')
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )
          ],
        )));
  }
}
