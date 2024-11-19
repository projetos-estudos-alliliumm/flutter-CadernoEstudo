import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_getx/models/recurso.dart';
import 'package:http/http.dart' as http;

class RecursoAPI extends State<Recurso> {
  var _recurso = <Recurso>[];

  @override
  void initState(){
    super.initState();

    _loadData();

  }

  _loadData() async{
    var url = Uri.parse("https://script.google.com/macros/s/AKfycbxGaLN-OmqmY_OebpM1nyuYPNdSAodlNeUjmB0EgEkJEAm22Zg/exec");

    try{
      var response = await http.get(url);
      setState((){

      });
      if(response.statusCode == 200){
        var data = json.decode(response.body);

      }
    }catch(error){
      print(error);
    }

  }

}


 getRecursos() async {
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        //print(data);
        return List<Recurso>.from(
            data["recursos"].map((x) => Recurso.fromJson(x)));
      } else {
        return List<Recurso>();
      }
    } catch (error) {
      print(error);
      return List<Recurso>();
    }
  }
}
