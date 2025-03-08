import '../model/user_response.dart';

abstract interface class UserRepositoryInterface {
  Future<List<UserResponse>> getUserResponseData();
}
