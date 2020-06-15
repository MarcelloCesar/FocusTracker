import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:focustracker/config/constantes.dart';
import 'package:focustracker/servicos/login.dart';
import 'package:focustracker/views/componentes/titulo_tela.dart';

class TelaCadastro extends StatefulWidget {
  TelaCadastro({Key key}) : super(key: key);

  @override
  _TelaCadastro createState() => _TelaCadastro();
}

class _TelaCadastro extends State<TelaCadastro> {

  TextEditingController _inputNome     = TextEditingController();
  TextEditingController _inputEmail    = TextEditingController();
  TextEditingController _inputSenha    = TextEditingController();
  TextEditingController _inputSenha2   = TextEditingController();
  TextEditingController _inputDtNasc   = TextEditingController();
  TextEditingController _inputCEP      = TextEditingController();
  TextEditingController _inputEndereco = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(child: Column(
        children: <Widget>[
          TituloTela(
            titulo: "FocusTracker",
            estilo: TextStyle(
              fontSize: 40,
              letterSpacing: 9,
              fontWeight: FontWeight.bold,
              color: Color(Constantes.DARK_BLUE)
            )
          ),
          _formCadastro(),
        ],
      ),
      ),
    );
  }

  Widget _formCadastro() {
    return Form(
      key: _formKey,

      child: Container(
        width: MediaQuery.of(context).size.width / 1.05,
        margin: EdgeInsets.only(top: 12, bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _inputNome,
              decoration: InputDecoration(
                labelText: "Nome Completo"
              ),
              validator: _validadorNome,
            ),
            TextFormField(
              controller: _inputEmail,
              decoration: InputDecoration(
                labelText: "Email"
              ),
//              validator: _validadorEmail,
            ),
            TextFormField(
              controller: _inputSenha,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha"
              ),
              validator: _validadorSenha,
            ),
            TextFormField(
              controller: _inputSenha2,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Confirmação de senha"
              ),
              validator: _validadorConfirmacaoSenha,
            ),
            TextFormField(
              controller: _inputDtNasc,
              decoration: InputDecoration(
                labelText: "Data de nascimento (DD/MM/AAAA)"
              ),
              validator: _validadorDtNasc,
            ),
            TextFormField(
              controller: _inputCEP,
              decoration: InputDecoration(
                labelText: "CEP"
              ),
              validator: _validadorCEP,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: FlatButton(
                color: Color(Constantes.DARK_BLUE),
                onPressed: () => _realizaCadastro(context),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "Cadastrar",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _validadorNome(String value) {
    if(value.contains(new RegExp(r'[^A-Za-z ]'), 1)){
      return "Nome inválido";
    }
    return null;
  }

  String _validadorEmail(String email) {
    if(EmailValidator.validate(email)){
      return null;
    }
    return "Insira um email válido";
  }

  String _validadorSenha(String senha){
    if(senha.length > 8 || senha.length < 4) {
      return "Insira uma senha que contenha entre 4 e 8 caracteres";
    }

    return null;
  }

  String _validadorConfirmacaoSenha(String senha) {
    if(senha != _inputSenha.text){
      return "As duas senhas digitadas não batem";
    }

    return null;
  }

  String _validadorDtNasc(String data) {


    return null;
  }

  String _validadorCEP(String data) {
    if ((data.length != 8) || (data.contains(new RegExp(r'[^0-9]'), 1))) {
      return "CEP inválido";
    }
    return null;
  }

  void _realizaCadastro(BuildContext context) async {
    if(!_formKey.currentState.validate()){
      return;
    }

    var cadastro = await fetchCadastro(_inputNome.text, _inputEmail.text, _inputSenha.text, _inputDtNasc.text, _inputCEP.text);
    if(cadastro.token != null){
      Constantes.tokenSessao = cadastro.token;
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/estatisticas');
    } else {
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title:Text("Erro"),
            content: Text("Cadastro não efetuado. \nVerifique os dados informados e tente novamente."),
            actions : <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                }
              )
            ]
          );
        },
      );
    }
  }
}