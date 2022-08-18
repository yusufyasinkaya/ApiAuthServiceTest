import 'package:authtest/response/response.dart';
import 'package:authtest/screens/loginscreen/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      appBarTheme: AppBarTheme(
        color: Color.fromARGB(255, 255, 180, 106),
  
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      ),
    
    
      ),
      home: ChangeNotifierProvider(create: (_)=> ResposnseUrl(),child: const LoginScreen(),),
    );
  }
}

