import 'package:flutter/material.dart';
import 'package:focustracker/views/componentes/barra_navegacao.dart';

class TelaLogin extends StatefulWidget {
  TelaLogin({Key key}) : super(key: key);

  @override
  _TelaLogin createState() => _TelaLogin();
}

class _TelaLogin extends State<TelaLogin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      bottomNavigationBar: BarraNavegacao(true),
    );
  }
}