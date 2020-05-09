class DadosEstatisticos {
  final int confirmados;
  final int suspeitos;
  final int descartados;
  final int curados;
  final int obitos;

  DadosEstatisticos({this.confirmados, this.suspeitos, this.descartados, this.curados, this.obitos});

  factory DadosEstatisticos.fromJson(Map<String, dynamic> json) {
    return DadosEstatisticos(
      confirmados: json['confirmados'],
      suspeitos: json['suspeitos'],
      descartados: json['descartados'],
      curados: json['curados'],
      obitos: json['obitos'],
    );
  }
}