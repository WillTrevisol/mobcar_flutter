import 'package:equatable/equatable.dart';

import 'package:mobcar/domain/entities/entities.dart';

class RemoteModel extends Equatable {
  const RemoteModel({required this.name, required this.code});

  final String name;
  final String code;

  factory RemoteModel.fromMap(Map<String, dynamic> data) {
    return RemoteModel(
      name: data['name'],
      code: data['code'],
    );
  }

  @override
  List<Object?> get props => [ name, code ];

  Model toDomainEntity() => Model(name: name, code: code);
}