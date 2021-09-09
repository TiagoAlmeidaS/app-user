import 'package:app_user/features/data/datasource/user_datasource_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import '../../mocks/user_mock.dart';
import '../../mocks/user_model_mock.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late UserDatasourceImplementation datasource;
  late http.Client client;

  setUp(() {
    client = MockClient();
    datasource = UserDatasourceImplementation(client);
    registerFallbackValue<Uri>(Uri());
  });

  test('should call the post method with correct url', () async {
    when(() => client.post(any()))
        .thenAnswer((_) async => http.Response(userMock, 200));

    await datasource.createUser(tUserModel);

    verify(() => client.post(Uri.http("localhost:8080", "/api/user")))
        .called(1);
  });
}
