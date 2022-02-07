abstract class ILoginDatasource {
  Future<String> getUserByEmailAndPassword(String email, String password);
}
