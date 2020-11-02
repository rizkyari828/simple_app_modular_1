import 'package:clean_arc_flutter/domains/entities/profile.dart';

abstract class ProfileRepository {
  Future<ProfileNew> showprofile();
}