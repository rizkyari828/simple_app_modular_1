import 'package:modular_1/app/infrastructure/endpoints.dart';
import 'package:modular_1/data/infrastructures/api_service_interface.dart';
import 'package:modular_1/data/persistences/mappers/user_mapper.dart';
import 'package:modular_1/data/persistences/repositories/user_repositories.dart';

import 'package:modular_1/domains/entities/user.dart';

class UserApiRepository extends UserRepository {
  late UserMapper _mapper;
  late ApiServiceInterface _service;
  late Endpoints _endpoints;

  UserApiRepository(
      ApiServiceInterface service, Endpoints endpoints, UserMapper mapper) {
    _mapper = mapper;
    _service = service;
    _endpoints = endpoints;
  }

  Future<User> show() async {
    dynamic resp;
    try {
      resp = await _service.invokeHttp(_endpoints.user(), RequestType.get);
    } catch (error) {
      rethrow;
    }
    return _mapper.getUserApiConverter(resp);
  }

  @override
  Future<List<User>>? getAll() {
    // TODO: implement getAll
    return null;
  }

  @override
  Future<bool>? verifyUserByPassword(request) {
    // TODO: implement verifyUserByPassword
    return null;
  }
}
