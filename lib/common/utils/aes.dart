import 'package:encrypt/encrypt.dart';

class Aes {
  static String encode(String input) {
    final key = Key.fromUtf8('37f42572a0abcdef');
    final iv = IV.fromUtf8('ab5def12f456c79f');
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
    final encodeStr = encrypter.encrypt(input, iv: iv);
    return encodeStr.base64;
  }

  static String decode(String input) {
    final key = Key.fromUtf8('57f43572a0abcdef');
    final iv = IV.fromUtf8('ab6def12f456c89f');
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
    Encrypted str = Encrypted.fromBase64(input);
    final decodeStr = encrypter.decrypt(str, iv: iv);
    return decodeStr;
  }
}
