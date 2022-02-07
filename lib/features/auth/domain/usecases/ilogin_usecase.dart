abstract class ILoginUsecase {
  Future<bool> call(String email, String password);
}
