class Brand {

  String? name;
  int? code;

  Brand();
  factory Brand.fromJson(Map<String, dynamic> data) {
    final Brand brand = Brand();

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