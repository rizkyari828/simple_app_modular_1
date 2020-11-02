import 'package:clean_arc_flutter/app/infrastructure/endpoints.dart';
import 'package:clean_arc_flutter/app/infrastructure/persistences/api_service.dart';
import 'package:clean_arc_flutter/app/repositories/api/auth_api_repository.dart';
import 'package:clean_arc_flutter/app/repositories/api/user_api_repository.dart';
import 'package:clean_arc_flutter/app/repositories/api/profile_api_repositort.dart';
import 'package:clean_arc_flutter/data/persistences/mappers/user_mapper.dart';
import 'package:clean_arc_flutter/data/persistences/mappers/profile_mapper.dart';
import 'package:injector/injector.dart';


class RepositoryModule {

  static void init(Injector injector) {
    injector.registerDependency<UserApiRepository>( (Injector injector) {
      return UserApiRepository(
        injector.getDependency<ApiService>(),
        injector.getDependency<Endpoints>(),
        injector.getDependency<UserMapper>()
      );
    });

    injector.registerDependency<ProfileAPIRepository>( (Injector injector) {
      return ProfileAPIRepository(
        injector.getDependency<ApiService>(),
        injector.getDependency<Endpoints>(),
        injector.getDependency<ProfileMapper>()
      );
    });
    
    injector.registerDependency<AuthApiRepository>( (Injector injector) {
      return AuthApiRepository(
        injector.getDependency<ApiService>(),
        injector.getDependency<Endpoints>(),
        injector.getDependency<UserMapper>()
      );
    });
  }
}