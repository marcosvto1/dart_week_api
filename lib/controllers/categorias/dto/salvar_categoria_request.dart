import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/categoria_model.dart';

class SalvarCategoriaRequest  extends Serializable{

  String nome;
  TipoCategoria tipoCategoria;

  @override
  Map<String, dynamic > asMap() {
    return {
      'nome' : nome,
      'tipoCategoria': tipoCategoria
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    nome = object['nome'] as String;
    final tipo = object['tipo'] as String;
    final tipoCategoriaEnum = TipoCategoria
      .values
      .firstWhere((t) =>  t.toString().split('.').last == tipo);
    tipoCategoria = tipoCategoriaEnum;
  }


  Map<String, String> validate() {
    final Map<String, String> mapValidate = {};
    if (nome == null || nome.isEmpty) {
      mapValidate['nome'] = 'Campo nome obrigatório';
    }

    if (tipoCategoria == null || tipoCategoria.toString().isEmpty) {
      mapValidate['tipoCategoria'] = 'Campo obrigatório';
    } 

    return mapValidate;
  }
}