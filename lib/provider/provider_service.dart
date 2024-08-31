import 'package:flutter/material.dart';
import '../apiService/api_service_class.dart';
import '../models/recycler_view_model.dart';

class UserProvider with ChangeNotifier {
  List<ModelClass> _users = [];
  final List<ModelClass> _favoriteUsers = [];

  List<ModelClass> get users => _users;
  List<ModelClass> get favoriteUsers => _favoriteUsers;

  final ApiServiceClass _userService = ApiServiceClass();

  UserProvider() {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    _users = await _userService.fetchUsers();
    notifyListeners();
  }

  void toggleFavorite(ModelClass user) {
    if (_favoriteUsers.contains(user)) {
      _favoriteUsers.remove(user);
    } else {
      _favoriteUsers.add(user);
    }
    notifyListeners();
  }

  bool isFavorite(ModelClass user) {
    return _favoriteUsers.contains(user);
  }
}
