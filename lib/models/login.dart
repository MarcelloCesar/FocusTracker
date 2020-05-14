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