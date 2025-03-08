import 'package:flutter/cupertino.dart';
import '../../outer_layer/model/user_response.dart';
import '../../outer_layer/repository/user_repository.dart';

class AppProvider with ChangeNotifier {
  AppProvider(this._repo);

  late UserRepository _repo;

  bool _isSuccess = false;

  bool get isSuccess => _isSuccess;

  List<UserResponse> _userResponse = [];

  List<UserResponse> get userResponse => _userResponse;

  //single banner

  //category
  List<Content> get topCategoryItems {
    if (userResponse.isEmpty) {
      return [];
    }
    var item = userResponse.where((e) => e.title.startsWith("Top categories"));
    if (item.isEmpty) {
      return [];
    }
    return item.first.contents ?? [];
  }

  //most popular
  List<Content> get mostPopularItems {
    if (userResponse.isEmpty) {
      return [];
    }
    var item = userResponse.where((e) => e.title.startsWith("Most Popular"));
    if (item.isEmpty) {
      return [];
    }
    return item.first.contents ?? [];
  }

  //top banner
  List<Content> get productImages {
    if (userResponse.isEmpty) {
      return [];
    }
    var item = userResponse.where((e) => e.title.startsWith("Top banner"));
    if (item.isEmpty) {
      return [];
    }
    return item.first.contents ?? [];
  }

  //single banner
  String? get singleProduct {
    var item = userResponse.where((e) => e.title.startsWith("ad banner"));
    if (item.isEmpty) {
     return '';
    }
    return item.first.imageUrl;

  }


  //featured product
  List<Content> get featuredItems {
    if (userResponse.isEmpty) {
      return [];
    }
    var item = userResponse.where((e) => e.title.startsWith("Best Sellers"));
    if (item.isEmpty) {
      return [];
    }
    return item.first.contents ?? [];
  }

  Future<void> generateData() async {
    // try {
    _userResponse = await _repo.getUserResponseData();
    _isSuccess = true;
    notifyListeners();
    // } catch (e) {
    //   _isSuccess = false;
    //   notifyListeners();
    //   rethrow;
    // }
  }
}
