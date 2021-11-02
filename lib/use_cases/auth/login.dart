import 'dart:async';
import 'package:modular_1/data/payload/api/auth/login_api_payload.dart';
import 'package:modular_1/data/payload/contracts/auth_request.dart';
import 'package:modular_1/data/persistences/repositories/auth_repository.dart';
import 'package:modular_1/domains/entities/user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class LoginUseCase extends UseCase<User, LoginRequestInterface> {
  AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Stream<User>> buildUseCaseStream(
      LoginRequestInterface? payload) async {
    final StreamController<User> _controller = StreamController();
    try {
      User user = await _repository.login(payload ?? LoginApiRequest());
      _controller.add(user);
      _controller.close();
    } catch (e) {
      // print(e);
      _controller.addError(e);
    }
    return _controller.stream;
  }
}
