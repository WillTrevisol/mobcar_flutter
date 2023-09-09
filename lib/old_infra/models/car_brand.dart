class CarBrand {

  String? name;
  String? code;

  CarBrand();
  factory CarBrand.fromJson(Map<String, dynamic> data) {
    final CarBrand brand = CarBrand();

    brand.name = data ['nome'];
    brand.code = data['codigo'];

    return brand;
  }

  String toShortString() {
    return '$name';
  }

  @override
  String toString() {
    return 'Name: $name, Code: $code';
  }
}