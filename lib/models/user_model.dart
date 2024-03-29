import 'dart:convert';

class UserModel {
  final int id;
  final String email;
  final String fullName;
  final String role;
  final String picUrl;

  UserModel({
    required this.id,
    required this.email,
    required this.fullName,
    required this.role,
    required this.picUrl,
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
