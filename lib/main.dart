import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: "Login From",
      home:LoginActivity(),

    );

  }
}
class LoginActivity extends StatefulWidget {
  const LoginActivity({super.key});

  @override
  State<LoginActivity> createState() => _LoginActivityState();
}

class _LoginActivityState extends State<LoginActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Register Page flutter'),
        backgroundColor:Colors.green,

      ),
      body:LoginActivityScreen(),
    );

  }
}
class LoginActivityScreen extends StatelessWidget {
  LoginActivityScreen({super.key});
  final _FromKey=GlobalKey<FormState>();
  final  TextEditingController _fastName=TextEditingController();
  final TextEditingController  _email=TextEditingController();
  final TextEditingController  _LastName=TextEditingController();
  final TextEditingController  _Password=TextEditingController();
  final TextEditingController  _ReTypePassword=TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(20),

        child:Form(
          key:_FromKey,
          child:Column(
            mainAxisAlignment:MainAxisAlignment.center,

            children: [
              Text("Register",
                  style:TextStyle(color:Colors.black,
                      fontSize:20,
                      fontWeight:FontWeight.bold)

              ),

              SizedBox(height:40,),
              TextFormField(
                controller:_fastName,
                decoration:InputDecoration(
                  label:Text("Name"),
                  hintText:"Name",
                  border:OutlineInputBorder(

                  ),
                ),
                validator:(value) {

                  if (value == null || value.isEmpty) {

                    return 'Please enter your username';

                  }

                  return null;

                },

              ),
              SizedBox(height:20,),
              TextFormField(
                controller:_LastName,
                decoration:InputDecoration(
                  label:Text("LastName"),
                  hintText:"LastName",
                  border:OutlineInputBorder(

                  ),
                ),
                validator:(value) {

                  if (value == null || value.isEmpty) {

                    return 'Please enter your username';

                  }

                  return null;

                },

              ),
              SizedBox(height:20,),

              TextFormField(
                controller:_email,

                obscureText:true,
                decoration:InputDecoration(
                   prefixIcon:Icon(Icons.email),
                  prefixText:"email",
                  label:Text("email"),
                  border:OutlineInputBorder(

                  ),
                ),

              ),
              SizedBox(height:20,),
              TextFormField(
                controller:_Password,

                obscureText:true,
                decoration:InputDecoration(
                  prefixIcon:Icon(Icons.password_rounded),
                  prefixText:"Password ",
                  label:Text("Password "),
                  border:OutlineInputBorder(

                  ),
                ),

              ),
              SizedBox(height:20,),

              TextFormField(
                controller:_ReTypePassword,

                obscureText:true,
                decoration:InputDecoration(
                  prefixIcon:Icon(Icons.password),
                  prefixText:"RetypePassword ",
                  label:Text("password"),
                  border:OutlineInputBorder(

                  ),
                ),

              ),
              SizedBox(height:20,),
              ElevatedButton(
                  onPressed: (){}, child:Text("Register",style:TextStyle(color:Colors.white),),
                  style:ElevatedButton.styleFrom(
                    elevation:10,
                    backgroundColor:Colors.green,
                  )
              ),
              SizedBox(height:20,),
              RichText(text:TextSpan(
                  children:[
                    TextSpan(
                        text:"Dont have a Account"
                    ),

                    TextSpan(
                      text: "? register ",
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                        },
                    )
                  ]
              ))
            ],

          ),
        )
    );
  }
}
