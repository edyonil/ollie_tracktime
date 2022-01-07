import 'package:ollie_tracktime/features/auth/domain/exception/login_or_password_exception.dart';
import 'package:ollie_tracktime/features/auth/domain/repositories/login_repository.dart';
import 'package:ollie_tracktime/features/auth/domain/repositories/save_shared_data_repository.dart';

class LoginUsecase {
  final ILoginRepository iLoginRepository;
  final ISaveSharedDataRepository iSaveSharedDataRepository;

  LoginUsecase(this.iLoginRepository, this.iSaveSharedDataRepository);

  Future<bool> call(String email, String password) async {
    try {
      final result = await iLoginRepository.login(email, password);
      await iSaveSharedDataRepository.save(result);
      return true;
    } on Exception catch (e) {
      throw LoginOrPassowordException(e.toString());
    }
  }
}
