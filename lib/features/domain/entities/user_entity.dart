import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name;
  final String email;
  final String cpfOrCnpj;
  final String tel;
  final String pass;

  UserEntity(
      {required this.name,
      required this.email,
      required this.cpfOrCnpj,
      required this.tel,
      required this.pass});


  @override
  List<Object?> get props => [name, email, cpfOrCnpj, tel, pass];
}
