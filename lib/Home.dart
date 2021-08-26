import 'package:flutter/material.dart';
import 'package:youtube/engine/CustomSearchDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricao.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _actualIndex = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/youtube.png', width: 92, height: 22),
        actions: [
          IconButton(
              onPressed: () async {
                String? res = await showSearch(
                    context: context, delegate: CustomSearchDelegate());
                print("resultado digitado: " + res!);
                setState(() {
                  _resultado = res;
                });
              },
              icon: Icon(Icons.search)),
        ],
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black, opacity: 0.5),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: telas[_actualIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _actualIndex,
          onTap: (int index) {
            setState(() {
              _actualIndex = index;
            });
          },
          fixedColor: Colors.red,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                //backgroundColor: Colors.red, //Como usado
                //BottomNavigationBarType.fixed, ele sobreescreve a cor
                icon: Icon(Icons.home),
                label: "Início"),
            BottomNavigationBarItem(
                //backgroundColor: Colors.blue,
                icon: Icon(Icons.whatshot),
                label: "Em alta"),
            BottomNavigationBarItem(
                //backgroundColor: Colors.green,
                icon: Icon(Icons.subscriptions),
                label: "Inscrições"),
            BottomNavigationBarItem(
                //backgroundColor: Colors.yellow,
                icon: Icon(Icons.folder),
                label: "Biblioteca")
          ]),
    );
  }
}
