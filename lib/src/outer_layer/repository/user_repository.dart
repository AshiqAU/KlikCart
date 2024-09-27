import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wc_demo/src/outer_layer/model/user_response.dart';
import '../../ui_lib/shared_prefs.dart';
import '../client/rest_client.dart';
import '../interface/user_interface.dart';

class UserRepository implements UserRepositoryInterface {
  final RestClient _client;

  UserRepository({required RestClient client}) : _client = client;

  @override
  Future<List<UserResponse>> getUserResponseData() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)|| connectivityResult.contains(ConnectivityResult.wifi)) {
      final apiResponse = await _client.getUserResponse();
      return apiResponse;
    } else {
      var data = (await SharedPreferences.getInstance()).getString('_data') ?? '[]';
      List<dynamic> jsonData = jsonDecode(data!);
      return jsonData.map((e) => UserResponse.fromJson(e)).toList();
    }
  }
}
