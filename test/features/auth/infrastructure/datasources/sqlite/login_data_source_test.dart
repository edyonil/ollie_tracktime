import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ollie_tracktime/core/exceptions/no_result_exception.dart';
import 'package:ollie_tracktime/features/auth/infrastructure/datasources/login_datasource.dart';
import 'package:ollie_tracktime/features/auth/infrastructure/datasources/sqlite/login_datasource.dart';
import 'package:sqflite/sqflite.dart';

class MockDatabase extends Mock implements Database {}

main() {
  late Database dataMock;
  late ILoginDatasource tLoginDatasource;

  setUp(() {
    dataMock = MockDatabase();
    tLoginDatasource = LoginDatasource(dataMock);
  });

  const email = 'edyonil@gmail.com';
  const password = '123456';

  const sql = 'SELECT * FROM users where email = ? and password = ? limit 1';

  final List<Map<String, Object?>> result = [
    {
      "id": "19893jf89739hf84y",
      "email": 'edyonil@gmail.com',
      "password": '123456',
      "admin": true,
      "company_id": "19893jf89739hf84ycompany"
    }
  ];

  const token = '19893jf89739hf84y_19893jf89739hf84ycompany';

  test('should return list with one user', () async {
    when(() => dataMock.rawQuery(sql, [email, password]))
        .thenAnswer((_) async => result);

    final tResult =
        await tLoginDatasource.getUserByEmailAndPassword(email, password);

    expect(tResult, token);

    verify(() => dataMock.rawQuery(sql, [email, password])).called(1);
  });

  test('should return no result exception', () async {
    when(() => dataMock.rawQuery(sql, [email, password]))
        .thenAnswer((invocation) async => []);

    expect(
        () async => tLoginDatasource.getUserByEmailAndPassword(email, password),
        throwsA(isA<NoResultException>()));

    verify(() => dataMock.rawQuery(sql, [email, password])).called(1);
  });
}
