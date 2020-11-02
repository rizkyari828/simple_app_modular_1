import 'package:clean_arc_flutter/domains/entities/profile.dart';

class ProfileMapper {
  ProfileNew getProfileApiConverter(Map<String, dynamic> response) {
    var data = response['data'];
    print("data dari UserMapper ${data['nama']}");
    return ProfileNew(
        name: data['nama'],
        alamat: data['alamat'],
        pekerjaan: data['pekerjaan']);
  }
}
