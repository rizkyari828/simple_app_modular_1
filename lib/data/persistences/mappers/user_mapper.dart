import 'package:modular_1/domains/entities/user.dart';

class UserMapper {
  User getUserApiConverter(Map<String, dynamic> response) {
    var data = response['data'];
    print("data dari UserMapper ${data['name']}");
    return User(
      id: data['id'],
      isRegistered: data['is_registered'],
      profile: Profile(
        name: data['profile']['name'],
        email: data['profile']['email'],
        phone: data['profile']['phone'],
      ),
    );
  }
}
