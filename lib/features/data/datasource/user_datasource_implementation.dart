import 'dart:convert';
import 'dart:io';

import 'package:app_user/core/usecase/errors/exceptions.dart';
import 'package:app_user/features/data/datasource/endpoints/user_endpoint.dart';
import 'package:app_user/features/data/datasource/user_datasource.dart';
import 'package:app_user/features/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserDatasourceImplementation implements IUserDatasource {
  final http.Client client;

  UserDatasourceImplementation(this.client);

  @override
  Future<UserModel> createUser(UserModel user) async {
    var response = await client.post(UserEndPoint.createUser(),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
        body: json.encode(user.toJson()));
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else if (response.statusCode == 400) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> errors = json["errors"];
      Map<String, dynamic> errors0 = errors[0];
      var defaultMessage = errors0["defaultMessage"];
      throw Exception(defaultMessage);
    } else {
      throw ServerException();
    }
  }
}
