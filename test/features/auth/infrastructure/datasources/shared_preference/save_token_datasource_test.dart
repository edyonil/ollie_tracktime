import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ollie_tracktime/features/auth/infrastructure/datasources/save_token_datasource.dart';
import 'package:ollie_tracktime/features/auth/infrastructure/datasources/shared_preference/save_token_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreference extends Mock implements SharedPreferences {}

void main() {
  late SharedPreferences mockSharedPreference;
  late ISaveTokenDatasource tSaveSharedDataSource;

  setUp(() {
    mockSharedPreference = MockSharedPreference();
    tSaveSharedDataSource = SaveTokenDatasource(mockSharedPreference);
  });

  const token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';

  const keyShared = 'TOKEN_APP';

  test('should save token in shared preference', () async {
    when(() => mockSharedPreference.setString(keyShared, token))
        .thenAnswer((invocation) async => true);

    final result = await tSaveSharedDataSource.saveToken(token);

    expect(result, token);

    verify(() => mockSharedPreference.setString(keyShared, token)).called(1);
  });

  test('should save token with exception', () async {
    when(() => mockSharedPreference.setString(keyShared, token))
        .thenAnswer((invocation) async => false);

    expect(
      () async => tSaveSharedDataSource.saveToken(token),
      throwsA(isA<Exception>()),
    );

    verify(() => mockSharedPreference.setString(keyShared, token)).called(1);
  });
}
