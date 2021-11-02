import 'package:modular_1/app/infrastructure/endpoints.dart';
import 'package:modular_1/data/infrastructures/api_service_interface.dart';
import 'package:modular_1/data/payload/api/auth/login_api_payload.dart';
import 'package:modular_1/data/payload/contracts/auth_request.dart';
import 'package:modular_1/data/persistences/mappers/user_mapper.dart';
import 'package:modular_1/data/persistences/repositories/auth_repository.dart';
import 'package:modular_1/domains/entities/user.dart';

class AuthApiRepository extends AuthRepository {
  late ApiServiceInterface _service;
  late Endpoints _endpoints;
  late UserMapper _mapper;

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
    return _mapper.getUserApiConverter(resp);
  }
}
