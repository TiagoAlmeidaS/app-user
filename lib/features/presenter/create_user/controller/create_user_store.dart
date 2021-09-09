import 'package:app_user/core/usecase/errors/failures.dart';
import 'package:app_user/features/data/datasource/user_datasource_implementation.dart';
import 'package:app_user/features/data/models/user_model.dart';
import 'package:app_user/features/domain/entities/user_entity.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:http/http.dart' as http;

class CreateUserStore extends NotifierStore<Failure, UserEntity> {
  UserDatasourceImplementation datasource;

  CreateUserStore(this.datasource)
      : super(
            UserEntity(name: '', email: '', cpfOrCnpj: '', tel: '', pass: ''));

  Future<UserModel> createUser(UserModel userModel) async {
    datasource = UserDatasourceImplementation(http.Client());
    return await datasource.createUser(userModel);
  }
}
