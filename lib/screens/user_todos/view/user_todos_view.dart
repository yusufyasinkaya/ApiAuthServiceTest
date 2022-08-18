import 'dart:developer';

import 'package:authtest/screens/user_todos/model/todos.dart';
import 'package:authtest/screens/user_todos/viewmodel/user_todos_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class UserTodosView extends StatefulWidget {
  const UserTodosView({Key? key}) : super(key: key);

  @override
  State<UserTodosView> createState() => _UserTodosViewState();
}

class _UserTodosViewState extends State<UserTodosView> {
  @override
  Widget build(BuildContext context) {
    final viewmodel = Provider.of<UserTodosViewmodel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My todos"),
      ),
      body: viewmodel.state==StatusDataCheck.okay?
               ListView.builder(
                itemCount: viewmodel.todosModel!.todos!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(viewmodel.todosModel!.todos![index].todo ?? ""),
                    subtitle: viewmodel.todosModel!.todos![index].completed == false
                        ? const Text("Tamamlanmadı")
                        : const Text("Tamamlandı"),
                    trailing: TextButton(
                      onPressed: () async{
                       bool result= await viewmodel.todosPut(viewmodel.todosModel!.todos![index].id!,
                            !viewmodel.todosModel!.todos![index].completed!, index);

                            viewmodel.todosModel!.todos![index].completed=result;
                      },
                      child: Text("Update"),
                    ),
                  );
                }
    ):Center(child: CircularProgressIndicator(),)
    );
            } 
           
            
          }
    
  

