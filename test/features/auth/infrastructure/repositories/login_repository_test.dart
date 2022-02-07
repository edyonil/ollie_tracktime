import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ollie_tracktime/features/auth/domain/repositories/login_repository.dart';
import 'package:ollie_tracktime/features/auth/infrastructure/datasources/login_datasource.dart';
import 'package:ollie_tracktime/features/auth/infrastructure/repositories/login_repository.dart';

class MockILoginDatasource extends Mock implements ILoginDatasource {}

void main() {
  late ILoginDatasource iLoginDatasource;
  late ILoginRepository loginRepository;

  setUp(() {
    iLoginDatasource = MockILoginDatasource();
    loginRepository = LoginRepository(iLoginDatasource);
  });

  const email = 'edyonil@gmail.com';
  const password = '1234567890';

  const token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';

  test('should return token for authentication corret', () async {
    when(() => iLoginDatasource.getUserByEmailAndPassword(email, password))
        .thenAnswer((invocation) async => token);

    final result = await loginRepository.login(email, password);

    expect(result, token);
    verify(() => iLoginDatasource.getUserByEmailAndPassword(email, password))
        .called(1);
  });

  test('should return token for authentication with exception generator',
      () async {
    when(() => iLoginDatasource.getUserByEmailAndPassword(email, password))
        .thenThrow(Exception('Ocorreu erro na consulta'));

    expect(() async => await loginRepository.login(email, password),
        throwsA(isA<Exception>()));
    verify(() => iLoginDatasource.getUserByEmailAndPassword(email, password))
        .called(1);
  });
}
