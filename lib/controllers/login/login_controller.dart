import 'package:dart_week_api/controllers/login/dto/login_request.dart';
import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/services/usuario_service.dart';

class LoginController extends ResourceController {
  LoginController(this.context): usuarioService = UsuarioService(context);

  final ManagedContext context;
  final UsuarioService usuarioService;
  @Operation.post()
  Future<Response> login(@Bind.body() LoginRequest request) async {
    // print(request.asMap());
    final validate = request.validate();

    if (validate.isNotEmpty) {
      return Response.badRequest(body: validate);
    }
    
    final token = await usuarioService.login(request);
    return Response.ok({'autenticado': token != null, 'token': token});
  }
}