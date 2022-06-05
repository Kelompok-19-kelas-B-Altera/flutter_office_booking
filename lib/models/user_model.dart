import 'dart:convert';

class UserModel {
  final int uID;
  final String username;
  final String email;
  final String password;
  final String fullName;
  final String phone;
  final String role;

  UserModel({
    required this.uID,
    required this.username,
    required this.email,
    required this.password,
    required this.fullName,
    required this.phone,
    required this.role,
  });

  static tokenDecode(String rawToken) {
    final token = rawToken.split('.');
    String partToken = token[1].replaceAll('-', '+').replaceAll('_', '/');
    switch (partToken.length % 4) {
      case 0:
        break;
      case 2:
        partToken += '==';
        break;
      case 3:
        partToken += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }
    var data = jsonDecode(utf8.decode(base64Url.decode(partToken)));
    return data;
  }
}
