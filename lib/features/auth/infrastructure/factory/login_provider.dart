import 'package:get_it/get_it.dart';
import 'package:ollie_tracktime/core/inject.dart';
import 'package:ollie_tracktime/features/auth/domain/repositories/login_repository.dart';
import 'package:ollie_tracktime/features/auth/domain/repositories/save_token_data_repository.dart';
import 'package:ollie_tracktime/features/auth/domain/usecases/ilogin_usecase.dart';
import 'package:ollie_tracktime/features/auth/domain/usecases/login_usecase.dart';
import 'package:ollie_tracktime/features/auth/infrastructure/datasources/login_datasource.dart';
import 'package:ollie_tracktime/features/auth/infrastructure/datasources/sqlite/login_datasource.dart';
import 'package:ollie_tracktime/features/auth/infrastructure/factory/database_provider.dart';
import 'package:ollie_tracktime/features/auth/infrastructure/repositories/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqlite_api.dart';

class LoginProvider implements Inject {
  @override
  void init() {
    final GetIt _instance = GetIt.instance;

    _instance.registerSingletonAsync<Database>(() => DBProvider.database);

    _instance.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance(),
    );

    _instance.registerLazySingleton<ILoginDatasource>(
      () => LoginDatasource(_instance<Database>()),
    );

    _instance.registerLazySingleton<ILoginRepository>(
      () => LoginRepository(_instance()),
    );

    _instance.registerLazySingleton<ILoginUsecase>(
      () => LoginUsecase(
        _instance<ILoginRepository>(),
        _instance<ISaveTokenDataRepository>(),
      ),
    );
  }
}
