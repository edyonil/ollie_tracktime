import 'package:ollie_tracktime/features/auth/domain/exception/login_or_password_exception.dart';
import 'package:ollie_tracktime/features/auth/domain/exception/shared_repository_exception.dart';
import 'package:ollie_tracktime/features/auth/domain/repositories/login_repository.dart';
import 'package:ollie_tracktime/features/auth/domain/repositories/save_token_data_repository.dart';
import 'package:ollie_tracktime/features/auth/domain/usecases/ilogin_usecase.dart';

class LoginUsecase implements ILoginUsecase {
  final ILoginRepository iLoginRepository;
  final ISaveTokenDataRepository iSaveSharedDataRepository;

  LoginUsecase(this.iLoginRepository, this.iSaveSharedDataRepository);

  @override
  Future<bool> call(String email, String password) async {
    String result;

    try {
      result = await iLoginRepository.login(email, password);
    } on Exception catch (e) {
      throw LoginOrPassowordException(e.toString());
    }

    try {
      await iSaveSharedDataRepository.save(result);
      return true;
    } catch (e) {
      throw SharedRepositoryException(e.toString());
    }
  }
}
