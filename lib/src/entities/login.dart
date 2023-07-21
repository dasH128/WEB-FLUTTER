import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final bool auth;
  final String? token;
  final String? rol;
  final String? message;

  LoginResponse({
    required this.auth,
    this.token,
    this.rol,
    this.message,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        auth: json["auth"],
        token: json["token"] ?? '',
        rol: json["rol"],
        message: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "auth": auth,
        "token": token,
        "rol": rol,
        "message": message,
      };
}
