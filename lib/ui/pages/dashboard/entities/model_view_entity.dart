import 'package:equatable/equatable.dart';

class ModelViewEntity extends Equatable {
  const ModelViewEntity({required this.name, required this.code});

  final String name;
  final String code;
  
  @override
  List<Object?> get props => [ name, code ];

}
