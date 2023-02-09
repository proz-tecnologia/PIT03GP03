import 'package:get_it/get_it.dart';
import 'package:green/controller/controller.home.dart';
import 'package:green/controller/extract.controller.dart';
import 'package:green/core/logger/app_logger_impl.dart';

import 'package:green/infra/repositories/auth.repository_impl.dart';
import 'package:green/infra/repositories/transaction.repository_impl.dart';
import 'package:green/infra/services/auth.service.dart';
import 'package:green/infra/services/transaction.service.dart';

import 'package:green/stores/user.store.dart';
import 'package:green/view/pages/login/controller/login.controller.dart';

import 'package:green/view/pages/register/controller/register_controller.dart';

GetIt di = GetIt.I;

void registerDependencies() {
  di.registerSingleton<UserStore>(UserStore());
  di.registerSingleton<TransactionService>(TransactionService());

  di.registerSingleton<AppLoggerImpl>(AppLoggerImpl());
  di.registerSingleton<AuthService>(AuthService(di.get()));

  di.registerSingleton<TransactionRepositoryImpl>(
      TransactionRepositoryImpl(di.get()));

  di.registerSingleton<AuthRepositoryImpl>(
      AuthRepositoryImpl(di.get(), di.get()));

  ///Controllers
  di.registerLazySingleton<ControllerHome>(() => ControllerHome(di.get()));

  di.registerLazySingleton<ExtractController>(() => ExtractController());

  di.registerLazySingleton<RegisterController>(
      () => RegisterController(di.get()));

  di.registerLazySingleton<LoginController>(() => LoginController(di.get()));

  /*di.registerFactory(
    () => RegisterController(AuthRepositoryImpl(AuthService())),
  );*/

  ///Repositories
  //di.registerLazySingleton<HomeRepository>(() => HomeRepository());
}
