import '../../constants/credential/users_credential.dart';

abstract class MockUsers {
  static List<UserCredential> getUsers() {
    return [
      UserCredential(email: "green@green.com", password: "green"),
      UserCredential(email: "usuario@usuario.com", password: "admin123"),
    ];
  }
}
