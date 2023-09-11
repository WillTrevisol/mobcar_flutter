import 'package:equatable/equatable.dart';
import 'package:mobcar/domain/entities/entities.dart';

class RemoteBrand extends Equatable {
  const RemoteBrand({required this.name, required this.code});

  final String name;
  final String code;

  factory RemoteBrand.fromMap(Map<String, dynamic> data) {
    return RemoteBrand(
      name: data['name'],
      code: data['code'],
    );
  }
  
  @override
  List<Object?> get props => [ name, code ];

  Brand toDomainEntity() => Brand(name: name, code: code);
}
