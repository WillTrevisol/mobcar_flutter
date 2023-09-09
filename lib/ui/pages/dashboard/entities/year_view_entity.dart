import 'package:equatable/equatable.dart';

class YearViewEntity extends Equatable {
  const YearViewEntity({required this.name, required this.code});

  final String name;
  final String code;
  
  @override
  List<Object?> get props => [ name, code ];
}
