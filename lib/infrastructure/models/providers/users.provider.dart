import 'dart:convert';

import 'package:get/get.dart';
import 'package:sustaina/infrastructure/models/users.dart';

import '../../../config.dart';

class UsersProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map["method"] == "receptoresGlobales") {
        List<User> receptores =
            (map["data"] as List).map((item) => User.fromJson(item)).toList();
        return {
          "receptores": receptores,
        };
      }
      if (map is Map<String, dynamic>) return Equipos.fromJson(map);
      if (map is List)
        return map.map((item) => Equipos.fromJson(item)).toList();
    };

    httpClient.baseUrl = ConfigEnvironments.getEnvironments()["url"];
  }

  Future<dynamic> getReceptores(String mode) async {
    final response = await get('users?mode=$mode');
    print(jsonEncode(response.body));
    return response.body;
  }
}
