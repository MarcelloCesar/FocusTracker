
import 'package:focustracker/models/dados_estatisticos.dart';
import 'package:focustracker/config/constantes.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


Future<DadosEstatisticos> fetchDadosEstatisticos() async {
  final response = await http.get(Constantes.URL_API + 'estatistica');

  if(response.statusCode == 200){
    return DadosEstatisticos.fromJson(json.decode(response.body));
  }
}