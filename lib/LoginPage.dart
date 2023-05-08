import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapptwo/Dashboard.dart';
import 'package:flutterapptwo/Data/ContentsViewmodel.dart';
import 'package:flutterapptwo/LoginDashboardArguments.dart';
import 'package:flutterapptwo/SignupScreen.dart';
import 'package:flutterapptwo/Utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget{
  LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => loginPagee();
}

class loginPagee extends State<LoginPage>{


   TextEditingController _emailcontroller = TextEditingController();
   TextEditingController _passwordcontroller = TextEditingController();

   UnfocusDisposition disposition = UnfocusDisposition.scope;

   @override
  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(title:  Text("Login",style: GoogleFonts.astloch(fontSize: 27,fontWeight: FontWeight.bold)), centerTitle: true),
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Container(
          margin: EdgeInsets.all(20),
                        child: Column(
                children: [
                  Expanded(flex: 0,child: AnimatedContainer(padding: EdgeInsets.only(top: 24),
                      duration:Duration(seconds:1),
                      child: Column(children: [
                        Row(
                            children: [
                              Expanded(flex:1,child: Text("Login",style: GoogleFonts.almendra(color: Colors.white,fontSize: 40,fontStyle: FontStyle.italic))),
                              Expanded(flex:0,
                                  child: SizedBox(width: 100.0,child: OutlinedButton(
                                    onPressed: (){

                                      navigateToSignupScreen(context);
                                      },
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Colors.white10),
                                        shape:MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                                        side: MaterialStateProperty.all(BorderSide(width: 2.0,color: Colors.orange))
                                    ),
                                    child: const Padding(padding: EdgeInsets.only(top: 5,bottom: 5),child: Text("Create Account",textAlign:TextAlign.center,style: TextStyle(color: Colors.orange),),
                                    ),
                                  ),
                                  )
                              )
                            ]),
                        Padding(padding: const EdgeInsets.only(top: 10),
                            child:Row(
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(flex:1,child: Text("Fill in your details to continue.",style: GoogleFonts.almendra(color: Colors.white,fontSize: 20,fontStyle: FontStyle.italic)))
                                ])
                        )
                      ],)
                  ),),

                  Expanded(flex: 2,child: Container(padding:const EdgeInsets.only(top: 3),decoration:const BoxDecoration(color:Colors.black,borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
                    child: Column(
                        children: [

                          Padding(padding: EdgeInsets.only(top:50),
                              child:
                              TextField(
                                controller: _emailcontroller,
                                decoration: const InputDecoration(
                                    labelText: 'Email',
                                    hintText: "Enter Your Email Address.",
                                    hintStyle: TextStyle(color: Colors.white),
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white,width: 1.0),borderRadius: BorderRadius.all(Radius.circular(15))),
                                    disabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white,width: 1.0),borderRadius: BorderRadius.all(Radius.circular(15))),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white,width: 1.0),borderRadius: BorderRadius.all(Radius.circular(15)))
                                ),style: TextStyle(color: Colors.white),)
                          ),
                          Padding(padding: EdgeInsets.only(top:25),
                              child:
                              TextField(
                                controller: _passwordcontroller,
                                decoration: const InputDecoration(
                                    labelText: 'Password',
                                    hintText: "Enter Your Password.",
                                    hintStyle: TextStyle(color: Colors.white),
                                    labelStyle: TextStyle(color: Colors.white),
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white,width: 1.0),borderRadius: BorderRadius.all(Radius.circular(15))),
                                    disabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white,width: 1.0),borderRadius: BorderRadius.all(Radius.circular(15))),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white,width: 1.0),borderRadius: BorderRadius.all(Radius.circular(15)))
                                )
                                ,style: TextStyle(color: Colors.white),

                              )
                          ),

                          Padding(padding: EdgeInsets.only(top: 50),child:
                          SizedBox(
                              width: double.infinity,
                              child:
                              ElevatedButton(
                                  onPressed: (){

                                    var contentsViewmodel = context.watch<ContentsViewmodel>();
                                 //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(contentsViewmodel.sealedClass.toString())));
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("dkndkncvd")));
                                   // contentsViewmodel.getContent();
                                   // login(_emailcontroller.value.text,_passwordcontroller.value.text);
                                  },
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                  child:  Padding(padding: EdgeInsets.only(top: 6,bottom: 6),child: Text("  Login  ",style: GoogleFonts.sacramento(textStyle: const TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),),)
                              ))

                          ),
                          Padding(padding: EdgeInsets.only(top: 15),child:
                          Container(
                            child:  Row(mainAxisSize:MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,children: const [
                              Text("or",style: TextStyle(color: Colors.white),)
                            ],),)

                          ),
                          Padding(padding: EdgeInsets.only(top: 15),child:
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: (){
                                  navigateToSignupScreen(context);
                                },
                                style: ElevatedButton.styleFrom(backgroundColor:Colors.white10,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),side: BorderSide(width: 2,color: Colors.orange)),
                                child:  Padding(padding: EdgeInsets.only(top: 6,bottom: 6),child: Text("  Create  Account  ",style: GoogleFonts.sacramento(textStyle: const TextStyle(color: Colors.orange,fontSize: 25,fontWeight: FontWeight.bold)),),)
                            ),
                          )

                          ),


                        ]
                    ),
                  ),)

                ]))





        );

  }

  var focused = true;
  void setTextFieldFocus(bool isFocused){
    setState(() {
      primaryFocus?.unfocus(disposition: disposition);
      focused = isFocused;
    });
  }

  void login(String email, String password){

      if(email.isEmpty){
      context.showSnackbarr("Email is Empty");
      }
    else if(password.isEmpty){
      context.showSnackbarr("Password is Empty");
    }else if(email.isEmpty && password.isEmpty){
      context.showSnackbarr("Email and Password should not be empty");
    }else{

        setTextFieldFocus(false);

      var dialog = AlertDialog(content: Wrap(alignment:WrapAlignment.center,children: [ Column(children: [Text("Login Ssuccessfully"),TextButton(onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  Dashboard()
            ,settings: RouteSettings(arguments: LoginDashboardArguments(email,password))));
      }, child: Text("Ok"))],)],),
      elevation: 40.0,);

      showDialog(context: context, builder: (context)=>dialog);
    }
  }

  void navigateToSignupScreen(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupScreen()));
  }
}


