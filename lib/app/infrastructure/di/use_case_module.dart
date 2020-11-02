import 'package:clean_arc_flutter/app/repositories/api/auth_api_repository.dart';
import 'package:clean_arc_flutter/app/repositories/api/user_api_repository.dart';
import 'package:clean_arc_flutter/app/repositories/api/profile_api_repositort.dart';
import 'package:clean_arc_flutter/use_cases/auth/login.dart';
import 'package:clean_arc_flutter/use_cases/profile/profile.dart';
import 'package:clean_arc_flutter/use_cases/user/get_user.dart';
import 'package:injector/injector.dart';

// Commonly here to declare dependency injection
class UseCaseModule {
  static void init(Injector injector) {
    // Use case
    injector.registerDependency<GetUserUseCase>((Injector injector) {
      return GetUserUseCase(injector.getDependency<UserApiRepository>());
    });

    injector.registerDependency<ProfileUseCase>((Injector injector) {
      return ProfileUseCase(injector.getDependency<ProfileAPIRepository>());
    });

    injector.registerDependency<LoginUseCase>((Injector injector) {
      return LoginUseCase(injector.getDependency<AuthApiRepository>());
    });
  }
}
