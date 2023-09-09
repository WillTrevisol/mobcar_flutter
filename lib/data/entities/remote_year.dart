import 'package:equatable/equatable.dart';

import 'package:mobcar/domain/entities/entities.dart';

class RemoteYear extends Equatable {
  const RemoteYear({required this.name, required this.code});

  final String name;
  final String code;

  factory RemoteYear.fromMap(Map<String, dynamic> data) {
    return RemoteYear(
      name: data['name'],
      code: data['code'],
    );
  }
  
  @override
  List<Object?> get props => [ name, code ];
  
  Year toDomainEntity() => Year(name: name, code: code);
}
