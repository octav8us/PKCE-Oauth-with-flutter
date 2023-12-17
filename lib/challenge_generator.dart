import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class challengeGenerator {
  /// Allowed characters for generating the _codeVerifier
  static const String _charset =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';

  /// Generates a random string of 128 characters from the charset
  static String _createCodeVerifier() => List.generate(
        128,
        (i) => _charset[Random.secure().nextInt(_charset.length)],
      ).join();

  final codeVerifier = _createCodeVerifier();

  /// The code challenge is the base64url encoded SHA256 hash of the code verifier
  String get codeChallenge => base64Url
      .encode(sha256.convert(ascii.encode(codeVerifier)).bytes)
      .replaceAll('=', '');
}
