import 'dart:async';

import 'package:modular_1/data/persistences/repositories/user_repositories.dart';
import 'package:modular_1/domains/entities/user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

// Declaring usecase of the entity
class GetUserUseCase extends UseCase<User, void> {
  UserRepository _repository;

  GetUserUseCase(this._repository);

  @override
  Future<Stream<User>> buildUseCaseStream(void ignore) async {
    final StreamController<User> controller = new StreamController();
    try {
      User user = await _repository.show();
      controller.add(user);
      controller.close();
    } catch (e) {
      print(e);
      controller.addError(e);
    }
    return controller.stream;
  }
}
