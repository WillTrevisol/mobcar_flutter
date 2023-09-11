import 'package:equatable/equatable.dart';

class Model extends Equatable {
  const Model({required this.name, required this.code});

  final String name;
  final String code;
  
  @override
  List<Object?> get props => [ name, code ];

}
