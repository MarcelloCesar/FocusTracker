import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:focustracker/config/constantes.dart';
import 'package:focustracker/servicos/perfil.dart';
import 'package:focustracker/views/componentes/titulo_tela.dart';
import '../componentes/barra_navegacao.dart';

class TelaPerfil extends StatefulWidget {
  TelaPerfil({Key key}) : super(key: key);

  @override
  _TelaPerfil createState() => _TelaPerfil();
}

class _TelaPerfil extends State<TelaPerfil> {

  TextEditingController _inputNome     = TextEditingController();
  TextEditingController _inputEmail    = TextEditingController();
  TextEditingController _inputSenha    = TextEditingController();
  TextEditingController _inputSenha2   = TextEditingController();
  TextEditingController _inputDtNasc   = TextEditingController();
  TextEditingController _inputCEP      = TextEditingController();
  TextEditingController _inputDias     = TextEditingController();
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
          _formPerfil(),
        ],
      ),
      ),
      bottomNavigationBar: BarraNavegacao(true),
    );
  }

  Widget _formPerfil() {
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
              validator: _validadorEmail,
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
                  labelText: "CEP (Somente números)"
              ),
              validator: _validadorCEP,
            ),
            TextFormField(
              controller: _inputDias,
              decoration: InputDecoration(
                labelText: "Dias para exibição dos dados"
              ),
              validator: _validadorDias,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: FlatButton(
                color: Color(Constantes.DARK_BLUE),
                onPressed: () => _alteraPerfil(context),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                child: Text(
                  "Alterar",
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
    if(senha.length == 0) {
      if (senha.length > 8 || senha.length < 4) {
        return "Insira uma senha que contenha entre 4 e 8 caracteres";
      }
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
    if ((data.length != 8) || (data.contains(new RegExp(r'[^0-9]'), 1)))
      {
        return "CEP inválido";
      }
    return null;
  }

  String _validadorDias(String data) {
    if (data.contains(new RegExp(r'[^0-9]'), 1)) {
      return "Contém caracteres inválidos";
    }
    return null;
  }

  void _alteraPerfil(BuildContext context) async {
    if(!_formKey.currentState.validate()){
      return;
    }
    var status = await atualizaPerfil(_inputNome.text, _inputEmail.text, _inputSenha.text, _inputDtNasc.text, _inputCEP.text, 'token_teste');
  }
}