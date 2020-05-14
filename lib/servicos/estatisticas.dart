
import 'package:focustracker/models/dados_estatisticos.dart';
import 'package:focustracker/config/constantes.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


Future<DadosEstatisticos> fetchDadosEstatisticos(int doenca, int regiao) async {
  final response = await http.get(Constantes.URL_API + Constantes.ENDPOINT_ESTATISTICAS + '?doenca=' + doenca.toString() + "&regiao=" + regiao.toString());

  if(response.statusCode == 200){
    return DadosEstatisticos.fromJson(json.decode(response.body));
  }
}