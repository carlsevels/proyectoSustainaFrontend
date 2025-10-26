import 'package:get/get.dart';
import 'package:sustaina/config.dart';

class LoginProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      return map;
    };
    httpClient.baseUrl = ConfigEnvironments.getEnvironments()["url"];
  }

  // Future<dynamic> getUser() async {
  //   final response = await get('authentication');
  //   print("Response login: ${jsonEncode(response.body)}");
  //   return response.body;
  // }

  Future<dynamic> login(Map user, String mode) async {
    final auth = await post('authentication?mode=${mode}', user);
    // print("Auth body response: ${auth.body}");
    return auth;
  }

  Future<Response> deleteUser(int id) async => await delete('users/$id');
}
