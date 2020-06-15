import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:focustracker/config/constantes.dart';
import 'package:focustracker/models/login.dart';
import 'package:focustracker/servicos/login.dart';

class TelaLogin extends StatefulWidget {
  TelaLogin({Key key}) : super(key: key);

  @override
  _TelaLogin createState() => _TelaLogin();
}

class _TelaLogin extends State<TelaLogin> {

  TextEditingController _inputLogin = TextEditingController();
  TextEditingController _inputSenha = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<Login> retornoLogin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Container(
        margin: EdgeInsets.only(top: 145),
        child: Column(
          children: <Widget>[
            _logo(),
            _formLogin(context),
            _botoesLogin(context),
          ],
        )
      ),
    );
  }

  Widget _logo() {
    return Text(
      "FocusTracker",
      style: TextStyle(
        fontSize: 40,
        letterSpacing: 9,
        fontWeight: FontWeight.bold,
        color: Color(Constantes.DARK_BLUE)
      )
    );
  }

  Widget _formLogin(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 4,
        margin: EdgeInsets.only(top: 12, bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextFormField(
              controller: _inputLogin,
              decoration: InputDecoration(
                labelText: "Email"
              ),
              validator: _validadorLogin,
            ),
            TextFormField(
              controller: _inputSenha,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha"
              ),
              validator: _validadorSenha,
            ),
          ],
        )
      )
    );
  }

  Widget _botoesLogin(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget> [
        FlatButton(
          color: Color(Constantes.DARK_BLUE),
          onPressed: () => _realizaLogin(context),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Text(
            "Login",
            style: TextStyle(
              color: Colors.white
            ),
          ),
        ),
        FlatButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context, '/cadastro');
          },
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(Constantes.DARK_BLUE)),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Text(
            "Cadastrar",
            style: TextStyle(
              color: Color(Constantes.DARK_BLUE)
            ),
          ),
        )
      ]
    );
  }

  String _validadorLogin(String email) {
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

  void _realizaLogin(BuildContext context) async {
    String login = _inputLogin.text;
    String senha = _inputSenha.text;

    // Verifica se foi tudo validado corretamente
    if(!_formKey.currentState.validate())  {
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title:Text("Erro"),
            content: Text("Email e/ou Senha inválido(s)"),
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

      return;
    }

    var retorno = await fetchLogin(login, senha);
    if(retorno != null){
      // Verifica se foi retornado o login
      if(retorno.token != null) {
        Constantes.tokenSessao = retorno.token;
        // Navega até a tela correta
        Navigator.pushReplacementNamed(context, '/estatisticas');
      } else {
        showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              title:Text("Erro"),
              content: Text("Login não efetuado. Verifique suas credenciais."),
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
}

