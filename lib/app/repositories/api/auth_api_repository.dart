import 'package:clean_arc_flutter/app/infrastructure/endpoints.dart';
import 'package:clean_arc_flutter/data/infrastructures/api_service_interface.dart';
import 'package:clean_arc_flutter/data/payload/api/auth/login_api_payload.dart';
import 'package:clean_arc_flutter/data/payload/contracts/auth_request.dart';
import 'package:clean_arc_flutter/data/persistences/mappers/user_mapper.dart';
import 'package:clean_arc_flutter/data/persistences/repositories/auth_repository.dart';
import 'package:clean_arc_flutter/domains/entities/user.dart';

class AuthApiRepository extends AuthRepository {
  ApiServiceInterface _service;
  Endpoints _endpoints;
  UserMapper _mapper;

  AuthApiRepository(
      ApiServiceInterface service, Endpoints endpoints, UserMapper mapper) {
    _service = service;
    _endpoints = endpoints;
    _mapper = mapper;
  }

  Future<User> login(LoginRequestInterface loginRequest) async {
    dynamic resp;
    try {
      resp = await _service.invokeHttp(_endpoints.login(), RequestType.post,
          body: loginRequest as LoginApiRequest);
    } catch (error) {
      rethrow;
    }
    print("Masuk data repo ${resp}");
    return _mapper.getUserApiConverter(resp);
  }
}
