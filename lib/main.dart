import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //criando uma lista estática
  List _itens = [];

  void _recuperarItens() {
    _itens = [];
    //ultilizando for para realizar a montagem dos itens
    for (int i = 0; i <= 10; i++) {
      //para cada interação será criado um novo Map
      Map<String, dynamic> item = Map();
      item["titulo"] = "Titulo ${i} lorem ipsum";
      item["descrição"] = "descrição ${i} lorem ipsum";
      //adicionando o item a lista de itens
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    //antes de chamar o build carregar os itens
    _recuperarItens();
    return Scaffold(
        appBar: AppBar(
          title: Text("List view"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          //criando uma lista
          child: ListView.builder(
              //de acordo com o tamanho da list(lenght)
              itemCount: _itens.length,
              itemBuilder: (context, indice) {
                return ListTile(
                  title: Text(_itens[indice]["titulo"]),
                  subtitle: Text(_itens[indice]["descrição"]),
                );
              }),
        ));
  }
}
