import 'package:dart_week_api/model/usuario_model.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class JwtUtils {

  static const String _jwtChavePrivada = '0000000000000';
  
  static String gerarTokenJWT(UsuarioModel usuario) {
    final claimSet = JwtClaim(
      issuer: 'http://localhost',
      subject: usuario.id.toString(),
      otherClaims: <String, dynamic>{},
      maxAge: const Duration(days: 1)
    );
    final token = 'Bearer ${issueJwtHS256(claimSet, _jwtChavePrivada)}';
    return token;
  }

}