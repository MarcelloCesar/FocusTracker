class Login{
  final String email;
  final String token;
  final DateTime expiration;
  final bool status;

  Login({this.email, this.token, this.expiration, this.status});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      token: json['token']
    );
  }
}

class Usuario {
  final String nome;
  final String email;
  final String dtNasc;
  final String cep;
  final int dias;
  final String senha;

  Usuario({this.nome, this.email, this.dtNasc, this.cep, this.dias, this.senha});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      nome: json['nome'],
      email: json['email'],
      dtNasc: json['dtnasc'],
      cep: json['cep'],
      dias: json['dias'],
      senha: json['senha']
    );
  }
}