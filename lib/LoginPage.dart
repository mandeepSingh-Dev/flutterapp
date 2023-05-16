import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapptwo/Dashboard.dart';
import 'package:flutterapptwo/Data/ContentsViewmodel.dart';
import 'package:flutterapptwo/Data/ContetsRepository/ContentsRepository.dart';
import 'package:flutterapptwo/Data/model/PixabayData.dart';
import 'package:flutterapptwo/Data/model/UserData.dart';
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

   var alignmentt = Alignment.topRight;

   ContentsViewmodel? contentViewmodel = null;
   String emailError = "";
   String passwordError = "";

   @override
  Widget build(BuildContext context) {

     contentViewmodel = context.watch<ContentsViewmodel>();

     registerTextChangeListener();
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
                      child: Column(
                        children: [
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
                    child: SingleChildScrollView(
                      child:  Column(
                          children: [

                            Padding(padding: EdgeInsets.only(top:50),
                                child:
                                TextField(
                                  controller: _emailcontroller,
                                  decoration:   InputDecoration(
                                      labelText: 'Email',
                                      hintText: "Enter your email",
                                      errorText: emailError.isNotEmpty ? emailError : null,
                                      hintStyle: TextStyle(color: Colors.white),
                                      labelStyle: TextStyle(color: Colors.white),
                                      errorBorder: const OutlineInputBorder(borderSide: BorderSide(color:Colors.red,width: 1.0),borderRadius: BorderRadius.all(Radius.circular(15))),
                                      focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(color:Colors.red,width: 1.0),borderRadius: BorderRadius.all(Radius.circular(15))),
                                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white,width: 1.0),borderRadius: BorderRadius.all(Radius.circular(15))),
                                      disabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white,width: 1.0),borderRadius: BorderRadius.all(Radius.circular(15))),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white,width: 1.0),borderRadius: BorderRadius.all(Radius.circular(15)))
                                  ),style: TextStyle(color: Colors.white),)
                            ),
                            Padding(padding: EdgeInsets.only(top:25),
                                child:
                                TextField(
                                  controller: _passwordcontroller,
                                  decoration:  InputDecoration(
                                      labelText: 'Password',
                                      hintText: "Enter Your Password.",
                                      errorText: passwordError.isNotEmpty ? passwordError : null,
                                      hintStyle: const TextStyle(color: Colors.white),
                                      labelStyle: const TextStyle(color: Colors.white),
                                      focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(color:Colors.red,width: 1.0),borderRadius: BorderRadius.all(Radius.circular(15))),
                                      errorBorder: const OutlineInputBorder(borderSide: BorderSide(color:Colors.red,width: 1.0),borderRadius: BorderRadius.all(Radius.circular(15))),
                                      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color:Colors.white,width: 1.0),borderRadius: BorderRadius.all(Radius.circular(15))),
                                      disabledBorder: const OutlineInputBorder(borderSide: BorderSide(color:Colors.white,width: 1.0),borderRadius: BorderRadius.all(Radius.circular(15))),
                                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color:Colors.white,width: 1.0),borderRadius: BorderRadius.all(Radius.circular(15)))
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
                                      login(_emailcontroller.value.text,_passwordcontroller.value.text);
                                    },
                                    style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                    child:  Padding(padding: EdgeInsets.only(top: 6,bottom: 6),child: Text("  Login ",style: GoogleFonts.sacramento(textStyle: const TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),),)
                                ))),
                            Padding(padding: EdgeInsets.only(top: 15),child:
                            Container(
                              child:  Row(mainAxisSize:MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,children: const [
                                Text("or",style: TextStyle(color: Colors.white),)
                              ],),)

                            ),
                            Padding(padding: EdgeInsets.only(top: 15),child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: (){

                                    navigateToSignupScreen(context);

                                    },
                                  style: ElevatedButton.styleFrom(backgroundColor:Colors.white10,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),side: BorderSide(width: 2,color: Colors.orange)),
                                  child:  Padding(padding: EdgeInsets.only(top: 6,bottom: 6),child: Text("  Create  Account  ",style: GoogleFonts.sacramento(textStyle: const TextStyle(color: Colors.orange,fontSize: 25,fontWeight: FontWeight.bold)),),)
                              ),
                            ))     ,

                            Padding(padding: EdgeInsets.only(top: 15),child:
                            AnimatedContainer(duration: Duration(milliseconds: 200),alignment:alignmentt,color: Colors.blue,width: double.infinity,
                              child:SizedBox(
                                height: contentViewmodel?.count.toDouble(),
                                child: ElevatedButton(
                                    onPressed: (){
                                      navigateToSignupScreen(context);
                                    },
                                    style: ElevatedButton.styleFrom(backgroundColor:Colors.white10,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),side: BorderSide(width: 2,color: Colors.orange)),
                                    child:  Padding(padding: const EdgeInsets.only(top: 6,bottom: 6),child: Text("Create Account",style: GoogleFonts.sacramento(textStyle:  TextStyle(color: Colors.orange,fontSize: 30,fontWeight: FontWeight.bold)),),)
                                ),
                              ),)),
                          ]
                      )
                    )
                     ,
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

  void registerTextChangeListener(){
    _emailcontroller.addListener(doOnEmailTextChangeListener);

    _passwordcontroller.addListener(doOnPasswordTextChangeListener);

  }

  void doOnEmailTextChangeListener(){

    if(isLoginClicked){
    if(_emailcontroller.value.text.isEmpty){
      setState(() {
        emailError = "Please enter your email.";
      });
    }else{
      setState(() {
        emailError = "";
      });
    }}else{}
  }
   void doOnPasswordTextChangeListener(){
    if(isLoginClicked) {
      if (_emailcontroller.value.text.isEmpty) {
        setState(() {
          passwordError = "Please enter your password.";
        });
      } else {
        setState(() {
          passwordError = "";
        });
      }
    }
   }

   var isLoginClicked = false;
  void login(String email, String password){

    isLoginClicked = true;

    print("dkmdfkd: $email  $password");
    debugPrint("dfkmndfkdmf: KIKIIJKIJIJ");
      if(email.isEmpty){
        setState(() {
          emailError = "Please enter your email.";
        });
      }
    else if(password.isEmpty){
          setState(() {
            passwordError = "Please enter your password.";
          });
    }else if(email.isEmpty && password.isEmpty){
          setState(() {
              emailError = "Please enter your password.";
              passwordError = "Please enter your password.";
          });

    }else{
        setTextFieldFocus(false);

      var dialog = AlertDialog(content: Wrap(alignment:WrapAlignment.center,
        children:
        [ Column(children: [
          Text("Login Ssuccessfully"),
          TextButton(
              onPressed: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  Dashboard()
            ,settings: RouteSettings(arguments: LoginDashboardArguments(email,password))));
      },
              child: const Text("Ok"))],)],),
      elevation: 40.0,);

      showDialog(context: context, builder: (context)=>dialog);
    }
    context.showSnackbarr(emailError.toString());
  }

  void navigateToSignupScreen(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupScreen()));
  }


  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

}


