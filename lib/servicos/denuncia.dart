import 'package:focustracker/config/constantes.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<int> realizaDenuncia(String cep, String observacao, String coordenadas, String tipo, String token) async {
  String url = Constantes.URL_API + Constantes.ENDPOINT_DENUNCIA;
  final response = await http.post(url, body: jsonEncode(<String, String> {
    'coord'   : coordenadas,
    'tipo'    : tipo,
    'cep'     : cep,
    'observ'  : observacao,
    'token'   : token,
  })
  );

  return response.statusCode;
}