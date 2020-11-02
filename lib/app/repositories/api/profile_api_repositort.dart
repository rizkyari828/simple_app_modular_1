import 'package:clean_arc_flutter/app/infrastructure/endpoints.dart';
import 'package:clean_arc_flutter/data/infrastructures/api_service_interface.dart';
import 'package:clean_arc_flutter/data/persistences/mappers/profile_mapper.dart';
import 'package:clean_arc_flutter/data/persistences/repositories/profile_repository.dart';
import 'package:clean_arc_flutter/domains/entities/profile.dart';

class ProfileAPIRepository extends ProfileRepository {
  ApiServiceInterface _service;
  Endpoints _endpoints;
  ProfileMapper _mapper;

  ProfileAPIRepository(
      ApiServiceInterface service, Endpoints endpoints, ProfileMapper mapper) {
    _service = service;
    _endpoints = endpoints;
    _mapper = mapper;
  }
  Future<ProfileNew> showprofile() async {
    dynamic resp;
    try {
      resp = await _service.invokeHttp(_endpoints.profile(), RequestType.get);
    } catch (error) {
      rethrow;
    }
     print("Masuk data repo ${resp}");
    return _mapper.getProfileApiConverter(resp);
  }
}
