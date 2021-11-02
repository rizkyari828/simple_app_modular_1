import 'package:modular_1/data/payload/contracts/auth_request.dart';
import 'package:modular_1/domains/entities/user.dart';

// Declaring interface that the entity should be implemented
abstract class AuthRepository {
  Future<User> login(LoginRequestInterface loginRequest);
}
