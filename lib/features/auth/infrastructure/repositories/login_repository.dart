import 'package:ollie_tracktime/features/auth/domain/repositories/login_repository.dart';
import 'package:ollie_tracktime/features/auth/infrastructure/datasources/login_datasource.dart';

class LoginRepository implements ILoginRepository {
  final ILoginDatasource iLoginDatasource;

  LoginRepository(this.iLoginDatasource);

  @override
  Future<String> login(String email, String password) async {
    final result =
        await iLoginDatasource.getUserByEmailAndPassword(email, password);
    return result;
  }
}
