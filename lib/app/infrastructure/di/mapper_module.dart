import 'package:modular_1/data/persistences/mappers/user_mapper.dart';
import 'package:injector/injector.dart';

class MapperModule {
  static void init(Injector injector) {
    injector.registerSingleton<UserMapper>(() => UserMapper());
  }
}
