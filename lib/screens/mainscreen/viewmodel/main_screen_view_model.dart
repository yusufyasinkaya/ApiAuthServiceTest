import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../user_todos/model/todos.dart';

class MainScreemViewModel with ChangeNotifier{
  MainScreemViewModel? mainScreemViewModel;

  late Dio dio;
  MainScreemViewModel() {
    dio = Dio();
  }


   TodosModel? todosModel;
  Future todosResponse(int userId) async {
     Response response = await dio.get("https://dummyjson.com/users/${userId.toString()}/todos");
     todosModel = TodosModel.fromJson(response.data);
     notifyListeners();


}
}