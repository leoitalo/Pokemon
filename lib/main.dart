// Este arquivo é responsável pela inicialização do APP.

// Import da Class MaterialApp que tem os Widgets de Layout.
import 'package:flutter/material.dart';
// Import da Class View Pokemon.
// Class responsável pela exibição dos dados e telas
import 'package:pokemon/poke_view.dart';

// Método principal onde chama outro método runApp, responsável em execultar a Class MyApp.
void main() {
  runApp(MyApp());
}

// Class que se extende da Class Statelesswidget (Não sofre alteração de estado) e é a Class responsável para iniciar todo o APP.
// Ela retorna um Widet MaterialApp que é extendido do arquivo importado material.dart
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Esta Class tem propriedades onde neste exemplo chama o title: e o home: ... O title é mo título do APP que irá aparecer, já
    // o home: será a chamada para a class view inicial do APP
    return MaterialApp(
      title: 'Pokemon APP',
      home: PokeView(),
    );
  }
}