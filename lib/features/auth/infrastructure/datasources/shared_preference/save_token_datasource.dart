import 'package:ollie_tracktime/features/auth/infrastructure/datasources/save_token_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveTokenDatasource implements ISaveTokenDatasource {
  final SharedPreferences sharedPreferences;

  final _key = 'TOKEN_APP';

  SaveTokenDatasource(this.sharedPreferences);

  @override
  Future<String> saveToken(String token) async {
    final result = await sharedPreferences.setString(_key, token);
    if (!result) {
      throw Exception("Err saved shared preference with $_key");
    }
    return token;
  }
}
