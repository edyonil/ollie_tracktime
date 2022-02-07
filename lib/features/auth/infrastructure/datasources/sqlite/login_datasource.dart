import 'package:ollie_tracktime/core/exceptions/no_result_exception.dart';
import 'package:ollie_tracktime/features/auth/infrastructure/datasources/login_datasource.dart';
import 'package:sqflite/sqlite_api.dart';

class LoginDatasource implements ILoginDatasource {
  final Database database;

  final _table = 'users';

  final _email = 'email';
  final _password = 'password';

  LoginDatasource(this.database);

  @override
  Future<String> getUserByEmailAndPassword(
    String email,
    String password,
  ) async {
    final sql =
        "SELECT * FROM $_table where $_email = ? and $_password = ? limit 1";

    final result = await database.rawQuery(sql, [email, password]);

    if (result.isEmpty) {
      throw NoResultException();
    }

    final user = result.first;

    return "${user['id']}_${user['company_id']}";
  }
}
