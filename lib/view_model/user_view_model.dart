import 'dart:js_util';

import 'package:flutter/material.dart';

import '../model/user_error.dart';
import '../model/user_model.dart';
import '../repo/api_status.dart';
import '../repo/user_service.dart';

class UsersViewmodel extends ChangeNotifier {
  bool _loading = true;
  List<UserModel> _usersList = [];
  UserError _userError = UserError(code: 0, message: "No Error");

  bool get loading => _loading;
  List<UserModel> get usersList => _usersList;
  UserError get userError => _userError;
  List<UserModel> favorite = [];
  List<UserModel> results = [];

  // final TextEditingController controllerName = TextEditingController();
  // final TextEditingController controllerEmail = TextEditingController();
  // final TextEditingController controller1City = TextEditingController();
  UsersViewmodel() {
    getUsers();
  }
  setfavoriteTap({required UserModel userModel}) {
    for (var i in usersList) {
      if (i.userId == userModel.userId) {
        i.isFavorite = !i.isFavorite;
        if (i.isFavorite) {
          favorite.add(i);
        } else {
          favorite.remove(i);
        }
        notifyListeners();
      }
    }
  }

  void searchRecipe(String value) {
    results.clear();
    for (var element in usersList) {
      if (element.fullName.toLowerCase().contains(value.toLowerCase()) ||
          element.work!.toLowerCase().contains(value.toLowerCase())) {
        results.add(element);
       
        notifyListeners();
      }
    }
  }

  setLoading(bool loadingStatus) async {
    _loading = loadingStatus;
    notifyListeners();
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  getUsers() async {
    setLoading(true);

    var res = await UserSevices.getUsersApi();

    if (res is Success) {
      setUserListModel(data: res.response as List<UserModel>);
    }
    if (res is Failure) {
      UserError userError =
          UserError(code: res.code, message: res.errorresponse.toString());
      setUserError(userError);
    }
    setLoading(false);
  }

  setUserListModel({required List<UserModel> data}) async {
    _usersList = data;

    notifyListeners();
  }
}
