import 'package:focustracker/config/constantes.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<int> atualizaPerfil(String nome, String email, String senha, String dtNasc, String cep, String token) async {
  String url = Constantes.URL_API + Constantes.ENDPOINT_PERFIL;
  final response = await http.post(url, body: jsonEncode(<String, String> {
    'nome'   : nome,
    'email'  : email,
    'senha'  : senha,
    'dtNasc' : dtNasc,
    'cep'    : cep,
    'token'  : token,
    })
  );

  return response.statusCode;
}