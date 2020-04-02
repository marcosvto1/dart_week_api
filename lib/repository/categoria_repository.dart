import 'package:dart_week_api/controllers/categorias/dto/salvar_categoria_request.dart';
import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/categoria_model.dart';

class CategoriaRepository {
  CategoriaRepository(this.context);

  final ManagedContext context;

  Future<List<CategoriaModel>> buscarCategoriaPorTipo(TipoCategoria tipoCategoria) {
    final query = Query<CategoriaModel>(context)
      ..where((c) => c.tipoCategoria).equalTo(tipoCategoria);

    return query.fetch();
  }

  Future<CategoriaModel> buscarPorId(int id) {
    final query = Query<CategoriaModel>(context)
      ..where((c) => c.id).equalTo(id);

    return query.fetchOne();
  }

  Future<void> salvarCategoria(SalvarCategoriaRequest request) async{
    final categoriaModel = CategoriaModel();
    categoriaModel.nome = request.nome;
    categoriaModel.tipoCategoria = request.tipoCategoria;

    await context.insertObject(categoriaModel);
  }
}