class Denuncia{
  final String coordenadas;
  final String cep;
  final String observacao;
  final int tipo;

  Denuncia({this.coordenadas, this.cep, this.observacao, this.tipo});

  factory Denuncia.fromJson(Map<String, dynamic> json) {
    return Denuncia(
      coordenadas: json['coordenadas'],
      cep: json['cep'],
      observacao: json['observacao'],
      tipo: json['tipo'],
    );
  }
}
