

import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutterapptwo/Constants.dart';
import 'package:flutterapptwo/Dashboard.dart';
import 'package:flutterapptwo/Data/model/UserData.dart';
import 'package:flutterapptwo/MWidgets.dart';
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
  TextEditingController confirmpasswordController = TextEditingController();

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
                    child:  MWidgets.formTextFieldWidget("First Name", "Enter your first name.", color, firstNameController)
                  ),
                  Padding(padding: const EdgeInsets.only(top: 10),
                    child:  MWidgets.formTextFieldWidget("Last Name", "Enter your last name.", color, lastNameController)
              ,),
                  Padding(padding:const  EdgeInsets.only(top: 10),
                    child:
                    MWidgets.formTextFieldWidget("Email", "Enter your Email Address.", color, emailController)
                    ,),
                  Padding(padding:const EdgeInsets.only(top: 10),
                    child:
                    MWidgets.formTextFieldWidget("Phone", "Enter your phone number.", color, phoneController)
                  ,),
                  Padding(padding:const EdgeInsets.only(top: 10),
                    child: MWidgets.formTextFieldWidget("Password", "Enter your password.", color, passwordController)
                    ,),
                  Padding(padding: const EdgeInsets.only(top: 10,bottom: 40),
                    child:
                    MWidgets.formTextFieldWidget("Confirm Password!", "Re-enter your Password.", color, confirmpasswordController)
                  ),
                 SizedBox(width: double.infinity,child:
                 TextButton(
                   onPressed: (){
                     //context.showSnackbarr("kdfnkdjfkdfdf");
                     signUp(firstNameController.value.text,lastNameController.value.text,emailController.value.text,passwordController.value.text,phoneController.value.text,confirmpasswordController.value.text,context);
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

  String firstNameError = "";
  String lastNameError = "";
  String emailError = "";
  String passwordError = "";
  String phoneNumberError = "";
  String confirmPasswordError = "";

  void signUp(String firstName,String lastName,String email,String password,String phoneNumber,String confirmPassword, BuildContext context) async{

    if(firstName.isEmpty){
      context.showSnackbarr("firstName");   setState(() {
          firstNameError = "Please enter your first name.";

        });
    }else if(lastName.isEmpty){
      context.showSnackbarr("lastName");  setState(() {
        lastNameError = "Please enter your last name.";
      });
    }else if(email.isEmpty){
      context.showSnackbarr("email");  setState(() {
        emailError = "Please enter your email.";
      });
    }else if(password.isEmpty){
      context.showSnackbarr("password"); setState(() {
        passwordError = "Please enter your password.";
      });
    }else if(phoneNumber.isEmpty){
      context.showSnackbarr("phoneNumber");  setState(() {
        phoneNumberError = "Please enter your phone number.";
      });
    }
    else if(confirmPassword.isEmpty){
      context.showSnackbarr("confirmPassword"); setState(() {
        confirmPasswordError = "Please confirm your password.";
      });
    }else {
      if(password != confirmPassword){
        context.showSnackbarr("confirmPassword dvfd"); setState(() {
          confirmPasswordError = "Confirmed password is not matched with password.";
        });
      }else{
        context.showSnackbarr("messgage");
        var userData = UserData(firstName,lastName,email,password,phoneNumber).tojson();
        var userdjson = jsonEncode(userData);
        addStringTo_ShrdPrfrnce(Constants.USERDATA,userdjson);

        var dialog = AlertDialog(content: Text("Signed up Succefully"),actions: [
          TextButton(onPressed: (){
            navigateToDashboard(context);
          }, child: Text("Ok"))
        ],);

        showDialog(context: context, builder: (context)=> dialog);
      }

      }
    }

  void navigateToDashboard(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dashboard()));
  }
}