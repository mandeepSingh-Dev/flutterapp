
import 'dart:convert';
import 'dart:developer';
import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapptwo/Constants.dart';
import 'package:flutterapptwo/Data/ContentsViewmodel.dart';
import 'package:flutterapptwo/Data/ContetsRepository/ContentsRepository.dart';
import 'package:flutterapptwo/Data/model/UserData.dart';
import 'package:flutterapptwo/Utils.dart';
import 'package:provider/provider.dart';

import 'LoginDashboardArguments.dart';

class Dashboard extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => DashBoardList();
}

class DashBoardList extends State<Dashboard>{

  ContentsViewmodel? contentViewmodel;

  @override
  Widget build(BuildContext context) {



    contentViewmodel = context.watch<ContentsViewmodel>();

    var r = getSharedPrefercneString(Constants.USERDATA);

    r.then((value) {
      var userData = JsonDecoder().convert(value) as UserData;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(userData.firstName+value)));

    });

    Isolate.spawn((message) {
      Future.delayed( const Duration(seconds: 4),(){
        var r = getSharedPrefercneString(Constants.USERDATA);
        r.then((value) {
          var userData = JsonDecoder().convert(value) as UserData;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(userData.firstName+value)));

        });
      });
    }, "message");

   // var logindashboardArgument = ModalRoute.of(context)?.settings.arguments as LoginDashboardArguments;


    return Scaffold(
        appBar:AppBar(title: Text("jhuj"),),
        body: Container(
          margin: EdgeInsets.all(20),
        child:Column(
        children: [
          TextField(
    decoration: InputDecoration(labelText:"First Name",hintText:"Enter your first name.",border: OutlineInputBorder(borderRadius: BorderRadius.circular(40),borderSide: const BorderSide(color: Colors.white,width: 2.0,style: BorderStyle.solid))),
    keyboardType: TextInputType.name,)
    ],),)
    );

  }

  Widget observeandSetData(){

    if(contentViewmodel?.sealedClass is Success) {
      var successData = contentViewmodel?.sealedClass as Success;


      return       Padding(padding: EdgeInsets.only(top: 15),child:
      Container(
        child:  Row(mainAxisSize:MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,children:  [
          Text(successData.data.toString(),style: TextStyle(color: Colors.white),)
        ],),));

      //return successData.data as PixabayData;
    }else if(contentViewmodel?.sealedClass is MyError){
      var error = contentViewmodel?.sealedClass as MyError;

      return Padding(padding: EdgeInsets.only(top: 15),child:
      Container(
        child:  Row(mainAxisSize:MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,children:  [
          Text(error.errorMessage.toString(),style: TextStyle(color: Colors.white),)
        ],),));
    }else if(contentViewmodel?.sealedClass is Loading){
      return Padding(padding: EdgeInsets.only(top: 15),child:
      Container(
        child:  Row(mainAxisSize:MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,children:  const [
          Text("Loading",style: TextStyle(color: Colors.white),)
        ],),));
    }else{
      return Padding(padding: EdgeInsets.only(top: 15),child:
      Container(
        child:  Row(mainAxisSize:MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,children:  const [
          Text("Finished",style: TextStyle(color: Colors.white),)
        ],),));
    }
  }

}