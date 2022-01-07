abstract class ILoginRepository {
  Future<String> login(String email, String password);
}
