import 'package:authtest/response/response.dart';
import 'package:authtest/screens/user_todos/view/user_todos_view.dart';
import 'package:authtest/screens/user_todos/viewmodel/user_todos_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../user_todos/model/todos.dart';

class MainScreem extends StatefulWidget {
  const MainScreem({required this.res, Key? key}) : super(key: key);
  final ResposnseUrl res;
  @override
  State<MainScreem> createState() => _MainScreemState();
}

class _MainScreemState extends State<MainScreem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 100,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(widget.res.model?.image ?? "")),
            ),
          ),
          Center(
            child: Text(
              "Hoşgeldiniz  ${widget.res.model?.firstName ?? ""} ${widget.res.model?.lastName ?? ""}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
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
              child: Text("Todos Sayfası"))
        ],
      ),
    );
  }
}
