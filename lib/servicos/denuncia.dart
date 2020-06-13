import 'package:focustracker/config/constantes.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:focustracker/models/denuncia.dart';

Future<int> realizaDenuncia(String cep, String observacao, String coordenadas, String tipo, String token) async {
  String url = Constantes.URL_API + Constantes.ENDPOINT_DENUNCIA;
  final response = await http.post(url, body: jsonEncode(<String, String> {
    'coordenadas' : coordenadas,
    'tipo'        : tipo,
    'cep'         : cep,
    'observacao'  : observacao,
    'token'       : token,
  })
  );

  return response.statusCode;
}

Future<Denuncia> fetchDadosDenuncia(int id) async {
  final response = await http.get(Constantes.URL_API + Constantes.ENDPOINT_DENUNCIA + '?id=' + id.toString());

  if(response.statusCode == 200){
    return Denuncia.fromJson(json.decode(response.body));
  }
}
