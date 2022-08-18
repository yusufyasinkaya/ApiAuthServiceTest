import 'package:authtest/response/response.dart';
import 'package:authtest/screens/mainscreen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  
  @override
  Widget build(BuildContext context) {
    final res = Provider.of<ResposnseUrl>(context);
    return Scaffold(
      
      body: Stack(alignment: AlignmentDirectional.bottomCenter,
      children: [
         
         Container(
          color: Color.fromARGB(255, 255, 180, 106),
          width: MediaQuery.of(context).size.width,
        
         child: Column(children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.15,),
            Image.asset("lib/assest/appbar.png",width: MediaQuery.of(context).size.width*0.35,),
            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
            Text("HOŞGELDİNİZ",style: Theme.of(context).textTheme.headlineSmall?.merge(TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            Text("Devam etmek için lütfen giriş yapın",style: TextStyle(color: Colors.white ),)
           ]),
         ),
         
        Container(
          height: MediaQuery.of(context).size.height*0.50,
          width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.vertical(top: Radius.circular(30),)),
          child: Column(
            
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              TextFormField(
                controller: res.emailController,
                decoration: InputDecoration(
                  labelText: "Kullanıcı adı",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01,),
              TextFormField(
                controller: res.passController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  
                  suffixIcon: Icon(Icons.password
                ),
                )
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05,),
              ElevatedButton(onPressed: ()async{
                StatusCheck result =await res.loginResponse();
                switch (result) {
                 
                  
                
                  case StatusCheck.istextEmpty:
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Alanları doldurun")));
                    break;
                  case StatusCheck.responseOk:
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen(res: res,)));
                    break;
                  case StatusCheck.responseError:
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Böyle bir kullanıcı bulunamadı")));
                    break;
                }
              }, child: Text("Giriş Yapın",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 180, 106)), minimumSize: MaterialStateProperty.all(const Size(200, 50)),shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      
    )
  )
 ),)
            ],

          ),

        )
      ],
      
      
      )
    );
    
  }
}