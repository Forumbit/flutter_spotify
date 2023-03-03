class RegisterApiProvider {
  Future<void> register(String fullname, String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
  }
}