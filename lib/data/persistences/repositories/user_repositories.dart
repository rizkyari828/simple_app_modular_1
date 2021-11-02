import 'package:modular_1/domains/entities/user.dart';

abstract class UserRepository {
  Future<User> show();
}
