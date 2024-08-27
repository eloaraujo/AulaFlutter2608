import 'package:flutter/material.dart';
import 'package:fruitstore/datasource/fruit.mock.dart';
import 'package:fruitstore/domain/fruit.dart';
import 'package:fruitstore/presentation/show_fruit.screen.dart';
import 'package:fruitstore/snnipets.dart';

class ListFruitScreen extends StatefulWidget {
  const ListFruitScreen({super.key});

@override
State<ListFruitScreen> createState() => _ListFruitScreenState();
}

//onde tem STATE vai começar a codar
class _ListFruitScreenState extends State<ListFruitScreen> {
  late List<Fruit> _fruits; //define uma variavel privada "_"

  void initState() {
    _fruits = fruitMock;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de frutas"),),
      body: ListView.builder(
          itemCount: _fruits.length, //tamanho da lista de frutas
          itemBuilder: (context, index) {
            return InkWell( //componente de click
              onTap: () { //abertura da próxima tels
                //espera receber o contexto e a tela que vai abrir -> OpenRoute
                openRoute(context, ShowFruitScreen(fruit: _fruits[index])); //dentro do arquivo de snnipets
              }, //pressionar o dedo sobre, executa uma ação
              child: ListTile(
                title: Text(_fruits[index].name),
                subtitle: Text(_fruits[index].price),
              ),
            );
          }),
    );
  }
}

