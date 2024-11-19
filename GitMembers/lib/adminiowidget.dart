import 'package:flutter/material.dart';
import 'package:http/http.dart'
    as http; //Nomear como http fazer a dependencia em pubspec.yaml
import 'dart:convert'; //Mapear o json no objeto
import 'member.dart';

//oBJETO DO TIPO STATE
class GitFluState extends State<GitFLuWidget> {
  var _members = <Member>[]; // _private
  final _font = const TextStyle(fontSize: 20.0); //Estilo de fonte

  @override
  void initState() {
    super.initState();

    _loadData(); //função privada
  }

//async /await para não disparar como outro processo, conexão com api rest
  _loadData() async {
    var url = Uri.parse("https://api.github.com/orgs/adobe/members");
    http.Response response = await http.get(url);
    //UI Thread
    setState(() {
      final membersJSON =
          jsonDecode(response.body); //Para coleção com chaves da api

      for (var member in membersJSON) {
        _members.add(Member(member["login"], member["avatar_url"]));
      }
    });
  }

  Widget _buildRow(int position) {
    return ListTile(
      title: Text("${_members[position].login}",
          style: _font), //nome de usuário atras da api com o 'LOGIN'
      leading: CircleAvatar(
        //Fotoo do usuário
        backgroundColor: Colors.green,
        backgroundImage: NetworkImage(_members[position].avatarUrl),
      ),
    );
  }

//Método Build para renderizar o seu layout]
//Caregar informações da api
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.8), //Desenhar coordenadas
      itemCount: _members.length, //Quantidade de itens na lista
      itemBuilder: (BuildContext context, int position) {
        return _buildRow(position);
      },
    );
  }
}

//Estado do widget será gerenciado pela classe GitFLuState

class GitFLuWidget extends StatefulWidget {
  @override
  createState() => GitFluState();
}
