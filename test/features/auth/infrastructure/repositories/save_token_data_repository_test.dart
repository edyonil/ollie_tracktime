import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ollie_tracktime/features/auth/domain/repositories/save_token_data_repository.dart';
import 'package:ollie_tracktime/features/auth/infrastructure/datasources/save_token_datasource.dart';
import 'package:ollie_tracktime/features/auth/infrastructure/repositories/save_token_data_repository.dart';

class MockSaveSharedDatasource extends Mock implements ISaveTokenDatasource {}

void main() {
  late ISaveTokenDatasource iSaveSharedDatasource;
  late ISaveTokenDataRepository saveSharedDataRepository;

  setUp(() {
    iSaveSharedDatasource = MockSaveSharedDatasource();
    saveSharedDataRepository = SaveTokenDataRepository(iSaveSharedDatasource);
  });

  const tokenJwt =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';

  test('should return string with token save', () async {
    when(() => iSaveSharedDatasource.saveToken(tokenJwt))
        .thenAnswer((_) async => tokenJwt);

    await saveSharedDataRepository.save(tokenJwt);

    verify(() => iSaveSharedDatasource.saveToken(tokenJwt)).called(1);
  });

  test('should return exception', () async {
    when(() => iSaveSharedDatasource.saveToken(tokenJwt))
        .thenThrow(Exception('Ocorreu um erro'));

    expect(
      () async => saveSharedDataRepository.save(tokenJwt),
      throwsA(isA<Exception>()),
    );

    verify(() => iSaveSharedDatasource.saveToken(tokenJwt)).called(1);
  });
}
