import 'package:authtest/screens/user_todos/model/todos.dart';
import 'package:authtest/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum StatusCheck {
  istextEmpty,
  responseOk,
  responseError,
}

class ResposnseUrl with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String _url = "https://dummyjson.com/auth/login";

  late Dio _dio;
  String? query;
// ignore: non_constant_identifier_names
  ResposnseUrl() {
    _dio = Dio();
  }

UserModel? model;
  Future<StatusCheck> loginResponse() async {
    if (passController.text.isNotEmpty && emailController.text.isNotEmpty) {
      Response response = await _dio.post(_url,
          data: ({
            "username": emailController.text,
            "password": passController.text,
          }));

      notifyListeners();
      if(response.statusCode==200 || response.statusCode==201){
        model = UserModel.fromJson(response.data);
        
        return StatusCheck.responseOk;
      
      }else{
        return StatusCheck.responseError;
      }

    } else {
      notifyListeners();

      return StatusCheck.istextEmpty;
    }
  }

}