
import 'dart:developer';
import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapptwo/Utils.dart';

import 'LoginDashboardArguments.dart';

class Dashboard extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => DashBoardList();
}

class DashBoardList extends State<Dashboard>{

  @override
  Widget build(BuildContext context) {

    Isolate.spawn((message) {
      Future.delayed( const Duration(seconds: 4),(){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Hello")));
      });
    }, "message");

    var logindashboardArgument = ModalRoute.of(context)?.settings.arguments as LoginDashboardArguments;


    return Scaffold(
        appBar:AppBar(title: Text(logindashboardArgument.email),),
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
}