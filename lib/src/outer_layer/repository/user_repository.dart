
import 'package:wc_demo/src/outer_layer/model/res.dart';
import 'package:wc_demo/src/outer_layer/model/user_response.dart';

import '../client/rest_client.dart';
import '../interface/user_interface.dart';

class UserRepository implements UserRepositoryInterface {
  final RestClient _client;

  UserRepository({required RestClient client}) : _client = client;

  @override
  Future<List<UserResponse>> getUserResponseData() async {

    return await _client.getUserResponse();
  }



}