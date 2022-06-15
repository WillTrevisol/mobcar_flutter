class Model {

  String? name;
  int? code;

  Model();
  factory Model.fromJson(Map<String, dynamic> data) {
    Model model = Model();

    model.name = data['nome'];
    model.code = data['codigo'];

    return model;
  }
}