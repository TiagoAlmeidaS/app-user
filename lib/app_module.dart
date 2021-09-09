import 'package:app_user/features/data/datasource/user_datasource_implementation.dart';
import 'package:app_user/features/presenter/create_user/controller/create_user_store.dart';
import 'package:app_user/features/presenter/create_user/create_use_page.dart';
import 'package:app_user/features/presenter/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => CreateUserStore(i())),
    Bind((i) => UserDatasourceImplementation(i())),
    Bind((i) => http.Client()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => CreateUserPage()),
    ChildRoute('/home', child: (_, __) => HomePage()),
  ];
}
