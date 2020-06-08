import 'package:flutter/material.dart';
import 'package:focustracker/views/telas/cadastro.dart';
import 'package:focustracker/views/telas/login.dart';
import 'package:focustracker/views/telas/perfil.dart';
import 'package:focustracker/views/telas/denuncia.dart';
import './views/telas/estatisticas.dart';

void main() => runApp(FocusTracker());

class FocusTracker extends StatefulWidget {
  FocusTracker({Key key}) : super(key: key);

  @override
  _FocusTracker createState() => _FocusTracker();
}

class _FocusTracker extends State<FocusTracker> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FocusTracker",
      routes: {
        '/': (context) => TelaDenuncia(),
        '/estatisticas' : (context) => TelaEstatisticas(),
        '/login': (context) => TelaLogin(),
        '/cadastro': (context) => TelaCadastro(),
        '/conta' : (context) => TelaPerfil(),
        '/denuncia': (context) => TelaDenuncia()
      }
    );
  }
}