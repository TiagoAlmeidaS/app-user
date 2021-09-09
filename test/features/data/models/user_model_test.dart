import 'dart:convert';

import 'package:app_user/features/data/models/user_model.dart';
import 'package:app_user/features/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/user_mock.dart';
import '../../mocks/user_model_mock.dart';

void main() {
  test('should be a subclass of SpaceMediaEntity', () {
    expect(tUserModel, isA<UserEntity>());
  });

  test('should return a valid model', () {
    final Map<String, dynamic> jsonMap = json.decode(userMock);

    final result = UserModel.fromJson(jsonMap);

    expect(result, tUserModel);
  });

  test('should return a json map containing the proper data', () {
    final userMap = {
      "name": "Tiago Almeida dos Santos",
      "email": "tigore21htl@gmail.com",
      "cpfOrCnpj": "00827504241",
      "tel": "95981233741"
    };

    final result = tUserModel.toJson();

    expect(result, userMap);
  });
}
