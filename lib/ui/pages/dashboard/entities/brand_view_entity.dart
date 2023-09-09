import 'package:equatable/equatable.dart';

class BrandViewEntity extends Equatable {
  const BrandViewEntity({required this.name, required this.code});

  final String name;
  final String code;
  
  @override
  List<Object?> get props => [ name, code ];
}
