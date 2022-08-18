import 'package:authtest/response/response.dart';
import 'package:authtest/screens/user_todos/view/user_todos_view.dart';
import 'package:authtest/screens/user_todos/viewmodel/user_todos_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../user_todos/model/todos.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({required this.res, Key? key}) : super(key: key);
  final ResposnseUrl res;
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Back"),
        centerTitle: true,
      ),
      body: 
      Column(
        children: [
          Container(
           
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(widget.res.model?.image ?? "")),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.03,),
          Center(
            child: Text(
              "${widget.res.model?.firstName ?? ""} ${widget.res.model?.lastName ?? ""}",
              style: Theme.of(context).textTheme.headline3!.merge(TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            ),
            
          ),
          Center(child:Text("Welcome",style: Theme.of(context).textTheme.headline3!.merge(TextStyle(color: Colors.black,fontWeight: FontWeight.bold))),),
          
          SizedBox(height: MediaQuery.of(context).size.height*0.1,),
         
          TextButton(
              onPressed: () async{

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ChangeNotifierProvider(
                              create: (context) =>
                                  UserTodosViewmodel(widget.res.model!.id!),
                              child: const UserTodosView(),
                            )));
              },
              child: Text("Todos Page",style: Theme.of(context).textTheme.headline4!.merge(TextStyle(fontWeight: FontWeight.w500,color: Color.fromARGB(255, 255, 180, 106))),))
        ],
      ),
    );
  }
}
