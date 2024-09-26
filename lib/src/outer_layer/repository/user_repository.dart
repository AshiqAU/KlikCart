
import '../client/rest_client.dart';
import '../interface/user_interface.dart';

class UserRepository implements UserRepositoryInterface {
  final RestClient _client;

  UserRepository({required RestClient client}) : _client = client;



}