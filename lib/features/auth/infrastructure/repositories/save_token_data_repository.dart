import 'package:ollie_tracktime/features/auth/domain/repositories/save_token_data_repository.dart';
import 'package:ollie_tracktime/features/auth/infrastructure/datasources/save_token_datasource.dart';

class SaveTokenDataRepository implements ISaveTokenDataRepository {
  final ISaveTokenDatasource saveSharedDatasource;

  SaveTokenDataRepository(this.saveSharedDatasource);

  @override
  Future<void> save(dynamic value) async {
    await saveSharedDatasource.saveToken(value as String);
  }
}
