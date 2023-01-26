import 'package:firebase_auth/firebase_auth.dart';
import 'package:green/models/api_response.dart';

abstract class AuthRepository {
  Future<APIResponse<String?>> createUser(
      String fullName, String email, String password, double limite);
  bool checkIfUserLogged();
  User getUser();
  Future<APIResponse<User?>> doLogin(String email, String password);
  Future<APIResponse<bool>> logout();
}
