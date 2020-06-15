import 'package:flutter/material.dart';
import '../../models/denuncia.dart';

class BoardDenuncia extends StatelessWidget {

  final Denuncia dadosDenuncia;

  BoardDenuncia(this.dadosDenuncia);

  @override
  Widget build(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width / 1.05,
      child: Column(
            children: <Widget>[
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Denuncia " + this.dadosDenuncia.id.toString(), style: TextStyle(fontSize: 18))),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("CEP: " + this.dadosDenuncia.cep, style: TextStyle(fontSize: 18))),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Coordenadas: " + this.dadosDenuncia.coordenadas, style: TextStyle(fontSize: 18))),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Observações:", style: TextStyle(fontSize: 18))),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(this.dadosDenuncia.observacao, style: TextStyle(fontSize: 18))),
            ],
          ),
        );
  }
}