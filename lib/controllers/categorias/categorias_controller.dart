import 'package:dart_week_api/controllers/categorias/dto/salvar_categoria_request.dart';
import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/categoria_model.dart';
import 'package:dart_week_api/services/categoria_service.dart';

class CategoriasController extends ResourceController {
  CategoriasController(this.context): categoriaService = CategoriaService(context);

  final ManagedContext context;
  final CategoriaService categoriaService;

  @Operation.get('tipo')
  Future<Response> buscarCategoriaPorTipo() async{
    try{ 
      final tipo = request.path.variables['tipo'];
      final tipoCategoria =  TipoCategoria.values.firstWhere((t) => t.toString().split('.').last == tipo);

      return categoriaService
        .buscarCategoriaPorTipo(tipoCategoria)
        .then((res) => res.map((c) => {'id': c.id, 'nome': c.nome}).toList())
        .then((data) => Response.ok(data));        

    }catch(e) {
      print(e);
      return Response.serverError(body: {'message': e.toString()});
    }
  }

  @Operation.post()
  Future<Response> salvarCategoria(@Bind.body() SalvarCategoriaRequest request) async{
    print(request.nome);
    await categoriaService.salvarCategoria(request);
    return Response.ok({});
  }
}