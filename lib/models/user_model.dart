import 'dart:convert';

class UserModel {
  final String email;
  final String fullName;
  final String role;

  UserModel({
    required this.email,
    required this.fullName,
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
