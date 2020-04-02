import 'package:dart_week_api/controllers/categorias/dto/salvar_categoria_request.dart';
import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/categoria_model.dart';
import 'package:dart_week_api/repository/categoria_repository.dart';

class CategoriaService {
  CategoriaService(this.context): categoriaRepository = CategoriaRepository(context);

  final ManagedContext context;
  final CategoriaRepository categoriaRepository;

  Future<List<CategoriaModel>> buscarCategoriaPorTipo(TipoCategoria tipoCategoria) {
    return categoriaRepository.buscarCategoriaPorTipo(tipoCategoria);
  }

  Future<void> salvarCategoria(SalvarCategoriaRequest request) async {
    await categoriaRepository.salvarCategoria(request);
  }
}