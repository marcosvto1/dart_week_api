import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/usuario_model.dart';

class UsuarioRepository {
  UsuarioRepository(this.context);

  final ManagedContext context;

  Future<UsuarioModel> recuperarUsuarioPorLoginESenha(String login, String senha) {
    final query = Query<UsuarioModel>(context)
    ..where((usuario) => usuario.login).equalTo(login)
    ..where((usuario) => usuario.senha).equalTo(senha);
    // SELECT * FROM USUARIO WHERE LOGIN = ? AND SENHA = ?
    return query.fetchOne();
  }
}