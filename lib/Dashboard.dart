
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

    context.showSnackbarr(logindashboardArgument.email.toString());

    return Scaffold(
        appBar:AppBar(title: Text(logindashboardArgument.email),),body: Padding(padding: EdgeInsets.all(20),
    child: ListView(
      children:  [
        GestureDetector(child:Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
            ,child: Padding(padding: EdgeInsets.only(left: 35,top: 20,bottom: 20,right: 35),
              child: Row(children: const [
                Text("Hello 1",style: TextStyle(fontSize: 15)),
                Text("Hello 3",style: TextStyle(fontSize: 15))],mainAxisAlignment: MainAxisAlignment.spaceBetween),
            )),onTap: (){
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Clicked")));
        })
        ,
       const Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
            ,child: Padding(padding: EdgeInsets.only(left: 35,top: 20,bottom: 20,right: 20),
                child: Text("Hello",style: TextStyle(fontSize: 15),))),

       const Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
            ,child: Padding(padding: EdgeInsets.only(left: 35,top: 20,bottom: 20,right: 20),
                child: Text("Hello",style: TextStyle(fontSize: 15),))),

       const Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
            ,child: Padding(padding: EdgeInsets.only(left: 35,top: 20,bottom: 20,right: 20),
                child: Text("Hello",style: TextStyle(fontSize: 15),))),

       const Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
            ,child: Padding(padding: EdgeInsets.only(left: 35,top: 20,bottom: 20,right: 20),
                child: Text("Hello",style: TextStyle(fontSize: 15),))),

       const Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
            ,child: Padding(padding: EdgeInsets.only(left: 35,top: 20,bottom: 20,right: 20),
                child: Text("Hello",style: TextStyle(fontSize: 15),))),

       Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
            ,child: Padding(padding: EdgeInsets.only(left: 35,top: 20,bottom: 20,right: 20),
                child: Text("Hello",style: TextStyle(fontSize: 15),))),

       Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
            ,child: Padding(padding: EdgeInsets.only(left: 35,top: 20,bottom: 20,right: 20),
                child: Text("Hello",style: TextStyle(fontSize: 15),))),

       Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
            ,child: Padding(padding: EdgeInsets.only(left: 35,top: 20,bottom: 20,right: 20),
                child: Text("Hello",style: TextStyle(fontSize: 15),))),

       Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
            ,child: Padding(padding: EdgeInsets.only(left: 35,top: 20,bottom: 20,right: 20),
                child: Text("Hello",style: TextStyle(fontSize: 15),))),

       Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
            ,child: Padding(padding: EdgeInsets.only(left: 35,top: 20,bottom: 20,right: 20),
                child: Text("Hello",style: TextStyle(fontSize: 15),))),

       Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
            ,child: Padding(padding: EdgeInsets.only(left: 35,top: 20,bottom: 20,right: 20),
                child: Text("Hello",style: TextStyle(fontSize: 15),))),

       Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
            ,child: Padding(padding: EdgeInsets.only(left: 35,top: 20,bottom: 20,right: 20),
                child: Text("Hello",style: TextStyle(fontSize: 15),))),

       Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
            ,child: Padding(padding: EdgeInsets.only(left: 35,top: 20,bottom: 20,right: 20),
                child: Text("Hello",style: TextStyle(fontSize: 15),))),

       Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
            ,child: Padding(padding: EdgeInsets.only(left: 35,top: 20,bottom: 20,right: 20),
                child: Text("Hello",style: TextStyle(fontSize: 15),))),

       Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
            ,child: Padding(padding: EdgeInsets.only(left: 35,top: 20,bottom: 20,right: 20),
                child: Text("Hello",style: TextStyle(fontSize: 15),))),

       Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
            ,child: Padding(padding: EdgeInsets.only(left: 35,top: 20,bottom: 20,right: 20),
                child: Text("Hello",style: TextStyle(fontSize: 15),))),

       Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
            ,child: Padding(padding: EdgeInsets.only(left: 35,top: 20,bottom: 20,right: 20),
                child: Text("Hello",style: TextStyle(fontSize: 15),))),


      ]
     )));
  }
}