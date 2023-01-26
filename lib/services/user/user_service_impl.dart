// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:green/core/exceptions/failure.dart';
import 'package:green/core/exceptions/user_exists_exceptions.dart';
import 'package:green/core/logger/app_logger_impl.dart';
import 'user_service.dart';

class UserServiceImpl implements UserService {
  //final UserRepositoryImpl _userRepository;
  final AppLoggerImpl _log;

  UserServiceImpl({
    //required UserRepositoryImpl userRepository,
    required AppLoggerImpl log,
  }) : _log = log;
  // _userRepository = userRepository,

  @override
  Future<void> register(String email, String password) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;

      final userMethods = await firebaseAuth.fetchSignInMethodsForEmail(email);

      if (userMethods.isNotEmpty) {
        throw UserExistsExceptions();
      }

      //Back end
      //await _userRepository.register(email, password);

      final userRegister = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      userRegister.user!.sendEmailVerification();
    } on FirebaseException catch (e, s) {
      _log.error("Erro ao criar usuario no firebase", e, s);
      throw Failure(message: "Erro ao criar usuário!");
    }
  }
}
