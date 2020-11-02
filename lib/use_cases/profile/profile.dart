import 'dart:async';

import 'package:clean_arc_flutter/data/payload/contracts/auth_request.dart';
import 'package:clean_arc_flutter/data/persistences/repositories/profile_repository.dart';
import 'package:clean_arc_flutter/domains/entities/profile.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class ProfileUseCase extends UseCase<ProfileNew, LoginRequestInterface> {
  ProfileRepository _repository;

  ProfileUseCase(this._repository);

  @override
  Future<Stream<ProfileNew>> buildUseCaseStream(void ignore) async {
    final StreamController<ProfileNew> controller = StreamController();
    try {
      ProfileNew user = await _repository.showprofile();
      controller.add(user);
      controller.close();
    } catch (e) {
      print(e);
      controller.addError(e);
    }
    return controller.stream;
  }
}
