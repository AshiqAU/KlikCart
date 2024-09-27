import 'package:wc_demo/src/outer_layer/model/res.dart';

import '../model/user_response.dart';

abstract interface class UserRepositoryInterface {
  Future<List<UserResponse>> getUserResponseData();
}
