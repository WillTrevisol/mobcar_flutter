class CarModel {

  String? name;
  int? code;

  CarModel();
  factory CarModel.fromJson(Map<String, dynamic> data) {
    CarModel model = CarModel();

    model.name = data['nome'];
    model.code = data['codigo'];

    return model;
  }

  String toShortString() {
    return 'Name: $name';
  }

  @override
  String toString() {
    return 'Name: $name, Code: $code';
  }
}