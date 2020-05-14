import 'package:focustracker/config/constantes.dart';
import 'package:focustracker/models/login.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<Login> fetchLogin(String email, String senha) async {
  final response = await http.post(
    Constantes.URL_API + Constantes.ENDPOINT_LOGIN,
    body: jsonEncode(<String, String> {
      'email': email,
      'senha': senha,
    })
  );


  if(response.statusCode == 200){
    return Login.fromJson(json.decode(response.body));
  }

  return Login();
}