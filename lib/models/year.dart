class Year {

  String? name;
  int? code;

  Year();
  factory Year.fromJson(Map<String, dynamic> data) {
    Year year = Year();

    year.name = data['nome'];
    year.code = data['codigo'];

    return year;
  }
}