import 'package:app_user/features/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required String name,
    required String email,
    required String cpfOrCnpj,
    required String tel,
    required String? pass,
  }) : super(name: name, email: email, cpfOrCnpj: cpfOrCnpj, tel: tel, pass: pass!);


  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'],
      email: json['email'],
      cpfOrCnpj: json['cpfOrCnpj'],
      tel: json['tel'],
      pass: json['pass']??"");

  Map<String, dynamic> toJson() =>
      {'name': name, 'email': email, 'cpfOrCnpj': cpfOrCnpj, 'tel': tel, 'pass': pass};
}
