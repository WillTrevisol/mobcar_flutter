import 'package:equatable/equatable.dart';

class Brand extends Equatable {
  const Brand({required this.name, required this.code});

  final String name;
  final String code;
  
  @override
  List<Object?> get props => [ name, code ];
}
