import 'package:clean_arc_flutter/domains/entities/user.dart';

abstract class UserRepository {
  Future<User> show();
}