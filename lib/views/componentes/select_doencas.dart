import 'package:flutter/material.dart';
import '../../models/doenca.dart';


class SelectDoencas extends StatefulWidget{

  SelectDoencas({Key key}) : super(key: key);

  @override
  _SelectDoencasState createState() => _SelectDoencasState();
}

class _SelectDoencasState extends State<SelectDoencas> {

  final List<Doenca> listaDoencas = <Doenca>[
    Doenca(
      codigo: 1,
      nome: "Corona Vírus",
    ),
    Doenca(
      codigo: 2,
      nome: "Dengue",
    ),
    Doenca(
      codigo: 1,
      nome: "Zika",
    )
  ];

  String valorSelecionado = "Zika";
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width,
      child: DropdownButton<String>(
        value: valorSelecionado,
        icon: Icon(Icons.keyboard_arrow_down),
        iconSize: 24,
        elevation: 8,
        isExpanded: true,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 20,
        ),
        underline: Container(
          height: 0
        ),
        onChanged: (String novoValor) {
          setState(() {
            valorSelecionado = novoValor;
          });
        },
        items: listaDoencas.map<DropdownMenuItem<String>>((Doenca doenca) {
          return DropdownMenuItem<String>(
            value: doenca.nome,
            child: Text(doenca.nome),
          );
        }).toList(),
      )
    );
  }
}
