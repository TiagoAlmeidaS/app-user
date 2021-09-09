import 'package:app_user/features/data/models/user_model.dart';

abstract class IUserDatasource {
  Future<UserModel> createUser(UserModel model);
}
