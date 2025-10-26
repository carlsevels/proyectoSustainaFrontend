import 'dart:convert';

import 'package:get/get.dart';
import 'package:sustaina/infrastructure/models/users.dart';

import '../../../config.dart';

class EquiposProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic> && map["method"] == "positions") {
        List<Equipos> ranking = (map["ranking"] as List)
            .map((item) => Equipos.fromJson(item))
            .toList();
        int myPosition = map["miPosicion"] ?? 0;
        return {
          "ranking": ranking,
          "miPosicion": myPosition,
        };
      }
      if (map is Map<String, dynamic>) return Equipos.fromJson(map);
      if (map is List)
        return map.map((item) => Equipos.fromJson(item)).toList();
    };

    httpClient.baseUrl = ConfigEnvironments.getEnvironments()["url"];
  }

  Future<dynamic> getRanking(String mode, int equipoId) async {
    final response = await get('equipos?mode=$mode&equipoId=$equipoId');
    print(jsonEncode(response.body));
    return response.body;
  }
}
