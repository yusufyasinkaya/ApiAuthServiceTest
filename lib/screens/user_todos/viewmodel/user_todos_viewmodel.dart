import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/todos.dart';

enum StatusDataCheck { okay, noData, error }

class UserTodosViewmodel with ChangeNotifier {
  late final Dio _dio;
  final int userId;
  StatusDataCheck _state = StatusDataCheck.noData;
  StatusDataCheck get state => _state;
  set state(StatusDataCheck state) {
    _state = state;
    notifyListeners();
  }

  UserTodosViewmodel(this.userId) {
    _dio = Dio(BaseOptions(baseUrl: "https://dummyjson.com/"));
    todosResponse();
  }
  TodosModel? todosModel;
  Future<TodosModel?> todosResponse() async {
    state = StatusDataCheck.noData;
    try {
      Response response = await _dio.get("users/${userId.toString()}/todos");
      //inspect(response);
      todosModel = TodosModel.fromJson(response.data);

      state = StatusDataCheck.okay;
      notifyListeners();
    } catch (e) {
      state = StatusDataCheck.error;
    }
  }

  Future todosPut(int todosID, bool isCompleted, int index) async {
    try {
      Response response = await _dio.put("todos/${todosID.toString()}",
          data: ({
            'completed': isCompleted,
          }));
      todosModel!.todos![index].completed = isCompleted;
      inspect(response);
      notifyListeners();
      if (response.statusCode != 200 || response.statusCode != 201) {
        return StatusDataCheck.noData;
      } else {
        return response.data["completed"];
      }
    } on DioError catch (e) {
      print(e.message);
      print(e.response);
    }
  }
}
