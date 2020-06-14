import 'package:focustracker/views/componentes/titulo_tela.dart';
import 'package:flutter/material.dart';
import '../componentes/radio_denuncias.dart';
import '../componentes/barra_navegacao.dart';
import 'package:focustracker/servicos/denuncia.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class TelaDenuncia extends StatefulWidget {
  TelaDenuncia({Key key}) : super(key: key);

  @override
  _TelaDenuncia createState() => _TelaDenuncia();
}

class _TelaDenuncia extends State<TelaDenuncia> {
  int tipo;
  TextEditingController _inputCEP = TextEditingController();
  TextEditingController _inputCoordenadas = TextEditingController();
  TextEditingController _inputObservacoes = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File _image;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    this.tipo = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Container(
        child: Column(
          children: <Widget>[
            TituloTela(
                titulo: "Denúncias",
                estilo: TextStyle(fontSize: 35)
            ),
            _formDenuncia(context),
            _botoesDenuncia(context),
          ],
        ),
      ),
      ),
        bottomNavigationBar: BarraNavegacao(true),
    );
  }

  Widget _formDenuncia(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width / 1.05,
        margin: EdgeInsets.only(top: 12, bottom: 50),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _inputCEP,
                decoration: InputDecoration(labelText: "CEP"),
                validator: _validadorCEP,
              ),
              TextFormField(
                controller: _inputCoordenadas,
                decoration: InputDecoration(labelText: "Coordenadas"),
              ),
              TextFormField(
                controller: _inputObservacoes,
                decoration: InputDecoration(labelText: "Observações"),
              ),
              RadioDenuncia(aoSelecionarRegiao: atualizaTipoDenuncia),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: FlatButton(
                  color: Colors.lightBlue,
                  onPressed: () => _showChoiceDialog(context),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                      "Carregar Imagem", style: TextStyle(color: Colors.white)),
                ),
              )
            ]
        ),
      ),
    );
  }

  Widget _botoesDenuncia(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 50),
          child: FlatButton(
            color: Colors.red,
            onPressed: () => cancelaDenuncia(context),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)),
            child: Text("Cancelar", style: TextStyle(color: Colors.white)),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 50),
          child: FlatButton(
            color: Colors.green,
            onPressed: () => incluiDenuncia(context),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)),
            child: Text("Confirmar", style: TextStyle(color: Colors.white)),
          ),
        )
      ],
    );
  }

  String _validadorCEP(String data) {
    data = data.trim();
    if ((data.length != 8) || (data.contains(new RegExp(r'[^0-9]'), 1))) {
      return "CEP inválido";
    }
    return null;
  }

  void atualizaTipoDenuncia(String tipo) {
      switch (tipo) {
        case 'Foco':
          this.tipo = 1;
          break;

        case 'Caso':
          this.tipo = 2;
          break;

        case 'Criadouro':
          this.tipo = 3;
          break;
      }
  }

  void enviaFoto() {
  }
  
  void incluiDenuncia(BuildContext context) async{
    if(!_formKey.currentState.validate()){
      return;
    }
    var status = await realizaDenuncia(_inputCEP.text, _inputObservacoes.text, _inputCoordenadas.text, this.tipo.toString(), 'token');
    print(status);
  }

  void cancelaDenuncia(BuildContext context){
    _inputCEP.clear();
    _inputCoordenadas.clear();
    _inputObservacoes.clear();
  }

  Future <void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Escolha uma opção"),
        content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                    child: Text("Galeria"),
                    onTap: (){
                      pegarImagemGaleria(context);
                    }
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text("Câmera"),
                  onTap: () {
                    pegarImagemCamera(context);
                  },
                )
              ],
            )
        ),
      );
    });
  }

  Future pegarImagemCamera(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  Future pegarImagemGaleria(BuildContext context) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

}