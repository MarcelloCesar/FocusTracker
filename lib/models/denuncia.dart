class Denuncia{
  final String coordenadas;
  final String cep;
  final String observacao;
  final int tipo;
  final int id;

  Denuncia({this.id, this.coordenadas, this.cep, this.observacao, this.tipo});

  factory Denuncia.fromJson(Map<String, dynamic> json) {
    return Denuncia(
      id: json['id'],
      coordenadas: json['coordenadas'],
      cep: json['cep'],
      observacao: json['observacao'],
      tipo: json['tipo'],
    );
  }
}
