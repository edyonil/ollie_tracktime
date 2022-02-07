import 'dart:ffi';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:ollie_tracktime/features/auth/domain/exception/login_or_password_exception.dart';
import 'package:ollie_tracktime/features/auth/domain/exception/shared_repository_exception.dart';
import 'package:ollie_tracktime/features/auth/domain/repositories/login_repository.dart';
import 'package:ollie_tracktime/features/auth/domain/repositories/save_token_data_repository.dart';
import 'package:ollie_tracktime/features/auth/domain/usecases/login_usecase.dart';

class MockILoginRepository extends Mock implements ILoginRepository {}

class MockISaveSharedDataRepository extends Mock
    implements ISaveTokenDataRepository {}

void main() {
  late ILoginRepository iLoginRepository;
  late ISaveTokenDataRepository iSaveSharedDataRepository;
  late LoginUsecase loginUsecase;

  setUp(() {
    iLoginRepository = MockILoginRepository();
    iSaveSharedDataRepository = MockISaveSharedDataRepository();
    loginUsecase = LoginUsecase(iLoginRepository, iSaveSharedDataRepository);
  });

  const tokenJwt =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c';

  const String email = 'edyonil@gmail.com';
  const String password = '1123456789';

  test('should return bool if user exist', () async {
    when(() => iLoginRepository.login(email, password))
        .thenAnswer((invocation) async => tokenJwt);

    when(() => iSaveSharedDataRepository.save(tokenJwt))
        .thenAnswer((invocation) async => Void);

    final result = await loginUsecase(email, password);

    expect(true, result, reason: 'Login valid');
    verify(() => iLoginRepository.login(email, password)).called(1);
    verify(() => iSaveSharedDataRepository.save(tokenJwt)).called(1);
  });

  test('should return exception if iLoginRepository return error', () async {
    when(() => iLoginRepository.login(email, password))
        .thenThrow(Exception('Ocorreu um erro no login'));

    when(() => iSaveSharedDataRepository.save(tokenJwt))
        .thenAnswer((_) async => Void);

    expect(() async => await loginUsecase(email, password),
        throwsA(isA<LoginOrPassowordException>()));
    verify(() => iLoginRepository.login(email, password)).called(1);
    verifyNever(() => iSaveSharedDataRepository.save(tokenJwt));
  });

  test('should return exception if iSaveSharedDataRepository return error',
      () async {
    when(() => iLoginRepository.login(email, password))
        .thenAnswer((invocation) async => tokenJwt);

    when(() => iSaveSharedDataRepository.save(tokenJwt))
        .thenThrow(Exception('ocorreu um erro no repository'));

    expect(
      () async => loginUsecase(email, password),
      throwsA(isA<SharedRepositoryException>()),
    );

    verify(() => iLoginRepository.login(email, password)).called(1);
    verifyNever(() => iSaveSharedDataRepository.save(tokenJwt));
  });
}
