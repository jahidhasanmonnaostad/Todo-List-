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
       title:Text('login Page '),
       backgroundColor:Colors.green,

     ),
     body:LoginActivityScreen(),
   );

  }
}
class LoginActivityScreen extends StatelessWidget {
   LoginActivityScreen({super.key});
   final _FromKey=GlobalKey<FormState>();
  final  TextEditingController userName=TextEditingController();
  final TextEditingController password=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(20),

    child:Form(
      key:_FromKey,
      child:Column(
      mainAxisAlignment:MainAxisAlignment.center,

      children: [
        Text("Login",
            style:TextStyle(color:Colors.black,
                fontSize:20,
                fontWeight:FontWeight.bold)

        ),

        SizedBox(height:40,),
        TextFormField(
          controller:userName,
          decoration:InputDecoration(
            label:Text("UserName"),
            hintText:"UserName",
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
        Container(
          child:Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Text("Password "),
            TextButton(onPressed:(){}, child:Text("Forget Password",style:TextStyle(color:Colors.red),)),
          ],
        ),),
        SizedBox(height:5,),
        TextFormField(
          controller:password,
          obscureText:true,
          decoration:InputDecoration(
            label:Text("Password "),
            hintText:"Password",
            border:OutlineInputBorder(

            ),
          ),

        ),
        SizedBox(height:20,),

        ElevatedButton(
          onPressed: (){}, child:Text("Login",style:TextStyle(color:Colors.white),),
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
