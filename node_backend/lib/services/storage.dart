import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage();

  static Future saveToken(String token) async {
    await _storage.write(key: "token", value: token);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: "token");
  }

  static Future saveUsername(String username) async {
    await _storage.write(key: "username", value: username);
  }

  static Future<String?> getUsername() async {
    return await _storage.read(key: "username");
  }

  static Future logout() async {
    await _storage.delete(key: "token");
  await _storage.delete(key: "username");
  }
}
