

import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutterapptwo/Constants.dart';
import 'package:flutterapptwo/Data/model/UserData.dart';
import 'package:flutterapptwo/Utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;

class SignupScreen extends StatefulWidget{
   SignupScreen({super.key});

  @override
  State<StatefulWidget> createState() => SignUpScreenState();

}

class SignUpScreenState extends State<SignupScreen>{

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var color = Colors.black;
  var imageString = "images/unsplashtwo.jpg";

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar:AppBar(title: const Text("Signup"),backgroundColor: Colors.transparent,),
        body: Container(
          height: MediaQuery.of(context).size.height,
            color: Colors.grey,
            child:Stack(
          children: [
            AnimatedContainer(duration: Duration(seconds: 4),
              child: Image(height:MediaQuery.of(context).size.height,image: Image.asset(imageString).image,opacity: AlwaysStoppedAnimation(0.9),fit: BoxFit.fill,),
                ),
            SingleChildScrollView(child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 10,bottom: 20),
                      child: Text("Sign up",style: GoogleFonts.almendra(color: Colors.white,fontSize: 40,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold))),
                  Padding(padding: const EdgeInsets.only(top: 10),
                    child: TextField(
                      decoration: InputDecoration(labelText:"First Name",hintText:"Enter your first name.",hintStyle:TextStyle(color: Colors.white),labelStyle: TextStyle(color: Colors.white),focusColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                        disabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                        enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                      ),style: TextStyle(color: color),
                      keyboardType: TextInputType.name,
                    controller: firstNameController,),),
                  Padding(padding: const EdgeInsets.only(top: 10),
                    child: TextField(
                      decoration: InputDecoration(labelText:"Last Name",hintText:"Enter your last name.",hintStyle:TextStyle(color: Colors.white),labelStyle: TextStyle(color: Colors.white),focusColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                        disabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                        enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                      ),style: TextStyle(color: color),
                      keyboardType: TextInputType.name,
                        controller: lastNameController),),
                  Padding(padding:const  EdgeInsets.only(top: 10),
                    child: TextField(
                      decoration: InputDecoration(labelText:"Email",hintText:"Enter your Email Address.",hintStyle:TextStyle(color: Colors.white),labelStyle: TextStyle(color: Colors.white),focusColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                        disabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                        enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                      ),style: TextStyle(color: color),
                      keyboardType: TextInputType.name,
                        controller: emailController),),
                  Padding(padding:const EdgeInsets.only(top: 10),
                    child:TextField(
                      decoration: InputDecoration(labelText:"Phone",hintText:"Enter your Phone number.",hintStyle:TextStyle(color: Colors.white),labelStyle: TextStyle(color: Colors.white),focusColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                        disabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                        enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                      ),style: TextStyle(color: color),
                      keyboardType: TextInputType.name,
                        controller: phoneController),),
                  Padding(padding:const EdgeInsets.only(top: 10),
                    child:TextField(
                      decoration: InputDecoration(labelText:"Password",hintText:"Enter your Password.",hintStyle:TextStyle(color: Colors.white),labelStyle: TextStyle(color: Colors.white),focusColor: Colors.white,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                        disabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                        enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                      ),style: TextStyle(color: color),
                      keyboardType: TextInputType.name,
                        controller: passwordController),),
                  Padding(padding: const EdgeInsets.only(top: 10,bottom: 40),
                      child:TextField(
                        decoration: InputDecoration(labelText:"Confirm Password",hintText:"R-enter your Password.",hintStyle:TextStyle(color: Colors.white),labelStyle: TextStyle(color: Colors.white),focusColor: Colors.white,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                          disabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                          enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid)),
                        ),style: TextStyle(color: color),
                        keyboardType: TextInputType.name,
                          ) ),
                 SizedBox(width: double.infinity,child:
                 TextButton(
                   onPressed: (){
                     //context.showSnackbarr("kdfnkdjfkdfdf");
                     signUp(firstNameController.value.text,lastNameController.value.text,emailController.value.text,passwordController.value.text,phoneController.value.text,context);
                   },
                   style: ButtonStyle( shape: MaterialStateProperty.all( RoundedRectangleBorder(side: const BorderSide(color:Colors.orange,width: 2.0),borderRadius: BorderRadius.circular(30)))),
                   child: Text("Sign up",
                       style: GoogleFonts.almendra(color: Colors.orange,fontSize: 20)),),)

                ],)
              ,),)

          ],

        ))


    );
  }

  void signUp(String firstName,String lastName,String email,String password,String phoneNumber,BuildContext context) async{


    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var userData = UserData(firstName,lastName, email, password, phoneNumber);

    try {
      var userDataStr = jsonEncode(userData.tojson());
      context.showSnackbarr(userDataStr);
      sharedPreferences.setString(Constants.USERDATA,userDataStr);

      await Future.delayed(Duration(seconds: 2),(){
        var userDataStr = sharedPreferences.getString(Constants.USERDATA);

        Map<String,dynamic>  f =   jsonDecode(userDataStr!);

        setState(() {
          if(color ==Colors.black) {
            color = Colors.white;
          }else{
            color = Colors.blue;
          }
        });

        setState(() {
          if(imageString == "images/unsplashtwo.jpg"){
            imageString = "images/unsplash.jpg";
          }else{
            imageString = "images/unsplashtwo.jpg";
          }
        });
        context.showSnackbarr("messgage");
      });
    }catch(e){
      context.showSnackbarr(e.toString());
      throw Exception(e);
    }


  //  sharedPreferences.setString(Constants.USERDATA,userData )
    

  }
}