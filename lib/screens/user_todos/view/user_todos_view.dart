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
               ListView.separated(
                padding: EdgeInsets.only(top: 15),
                separatorBuilder: ((context, index) {
                  return Divider(
                    color: Colors.black,

                  );
                }),
                itemCount: viewmodel.todosModel!.todos!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(viewmodel.todosModel!.todos![index].todo ?? "",style: Theme.of(context).textTheme.headline5,),
                    subtitle: viewmodel.todosModel!.todos![index].completed == false
                        ? const Text.rich(
                        TextSpan(
                          children: [
                                 TextSpan(text: "Not Completed   "),
                              
                                 WidgetSpan(child: Icon(Icons.highlight_remove_rounded,color: Color.fromARGB(255, 236, 0, 0),))
                          ]
                        ))
                        : const Text.rich(
                        TextSpan(
                          children: [
                                 TextSpan(text: "Completed   "),
                                 WidgetSpan(child: Icon(Icons.check_circle_rounded,color: Color.fromARGB(255, 0, 217, 7),))
                          ]
                        )),
                    trailing: TextButton(
                      onPressed: () async{
                       bool result= await viewmodel.todosPut(viewmodel.todosModel!.todos![index].id!,
                            !viewmodel.todosModel!.todos![index].completed!, index);

                            viewmodel.todosModel!.todos![index].completed=result;
                      },
                      child: Text("Update", style: TextStyle(color: Colors.black),),
                    ),
                  );
                }
    ):Center(child: CircularProgressIndicator(),)
    );
            } 
           
            
          }
    
  

