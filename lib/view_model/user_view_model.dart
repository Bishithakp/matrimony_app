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
  
  // final TextEditingController controllerName = TextEditingController();
  // final TextEditingController controllerEmail = TextEditingController();
  // final TextEditingController controller1City = TextEditingController();
  UsersViewmodel() {
    getUsers();
  }
 // setnewUser() {
    //usersList.add(newUser);
  
   // notifyListeners();
    // controllerName.clear();
    // controllerEmail.clear();
    // controller1City.clear();
 // }

  // setName(String name) {
  //   newUser.name = name;
  // }

  // setEmail(String email) {
  //   newUser.email = email;
  // }

  // setCity(String city) {
  //   newUser.address.city = city;
  // }

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