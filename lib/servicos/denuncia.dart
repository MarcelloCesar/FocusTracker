import 'package:focustracker/config/constantes.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:focustracker/models/denuncia.dart';

Future<bool> realizaDenuncia(String cep, String observacao, String coordenadas, String tipo, String token) async {
  String url = Constantes.URL_API + Constantes.ENDPOINT_DENUNCIA;
  final response = await http.post(url, body: jsonEncode(<String, String> {
    'coordenadas' : coordenadas,
    'tipo'        : tipo,
    'cep'         : cep,
    'observacao'  : observacao,
    'token'       : token,
  })
  );

  if(response.statusCode == 200) {
    Map<String, dynamic> resp = jsonDecode(response.body);
    return resp['status'];
  }
}

Future<Denuncia> fetchDadosDenuncia(int id) async {
  final response = await http.get(Constantes.URL_API + Constantes.ENDPOINT_DENUNCIA + '?id=' + id.toString());

  if(response.statusCode == 200){
    return Denuncia.fromJson(json.decode(response.body));
  }
}

Future<bool> alteraDenuncia(String tipo, int id) async {
  String url = Constantes.URL_API + Constantes.ENDPOINT_GERENCIAMENTO;
  final response = await http.post(url, body: jsonEncode(<String, String>{
    'tipo' : tipo,
    'id' : id.toString(),
  })
  );

  if(response.statusCode == 200) {
    Map<String, dynamic> resp = jsonDecode(response.body);
    return resp['status'];
  }
  return false;
}