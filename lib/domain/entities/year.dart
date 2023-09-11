import 'package:equatable/equatable.dart';

class Year extends Equatable {
  const Year({required this.name, required this.code});

  final String name;
  final String code;
  
  @override
  List<Object?> get props => [ name, code ];
}
