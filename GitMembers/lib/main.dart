import 'package:adminio_flutter/adminiowidget.dart';
import 'package:flutter/material.dart';


void main() => runApp(GitFLuApp());

class GitFLuApp extends StatelessWidget{
  @override
  //Widget Corpo e cabeçalho
  Widget build(BuildContext context){
    //Widget 
    return MaterialApp(

      title: "GitFlu",
      //Conteúdo Interno do Componente

      home: Scaffold( 
        //Para ter componentes Material Designer do Google com Appbar

        //Pode instanciar objetos com New como: "home: new Scaffold..." ou omitir o new, funcionará da mesma forma
        appBar: AppBar(

          title: Text("Título do App"),

        ),
        body: GitFLuWidget(),
        ),


    );
  }
}


