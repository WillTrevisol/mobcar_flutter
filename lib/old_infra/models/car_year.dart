class CarYear {

  String? name;
  String? code;

  CarYear();
  factory CarYear.fromJson(Map<String, dynamic> data) {
    CarYear year = CarYear();

    year.name = data['nome'];
    year.code = data['codigo'];

    return year;
  }

  String toShortString() {
    return 'Name: $name';
  }

  @override
  String toString() {
    return 'Name: $name, Code: $code';
  }
}