class AuthApiProviderIncorrectLoginError {}

class AuthApiProvider {
  Future<String> logIn(String email, String password) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    if (email == 'amirkharisov545@gmail.com' && password == '12345678') {
      return 'fsafdsfsdf:3424142432234525234';
    } else {
      throw AuthApiProviderIncorrectLoginError();
    }
  }
}
