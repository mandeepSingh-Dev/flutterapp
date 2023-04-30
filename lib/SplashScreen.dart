import 'dart:async';
import 'dart:ffi';
import 'dart:isolate';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/Dashboard.dart';
import 'package:flutterapp/LoginPage.dart';
import 'package:flutterapp/SplashScreen.dart';
import 'package:flutterapp/WidgetsUtil.dart';

class SplashScreen extends StatefulWidget {

  @override
  State createState() => SplashScreenWidget();
}

class SplashScreenWidget extends State<SplashScreen> with WidgetsBindingObserver{


  var str = "";
  void showCounting(count) {
    print("knvkfnvf");
    setState(() async {

     //  str = "Go to Login Page";

    });
  }

  void gotNextPage(){
    // await splashDelay();
     Navigator.of(context).pushNamed("/Loginscreen");
  }


  var isClicked = false;
  double borderRadius = 5;
  var iscompleted = false;
   Timer? timer;

  @override
  Widget build(BuildContext context)  {


    var timeCount = 0;


   timer = Timer.periodic(const Duration(seconds: 4), (timer) {

      setState((){
        iscompleted = true;
        borderRadius = 60;
      });

      timer?.cancel();

    });


double f = 90;

   return Scaffold(backgroundColor: Colors.amberAccent,
       body: Column(mainAxisSize: MainAxisSize.max,verticalDirection: VerticalDirection.down,mainAxisAlignment: MainAxisAlignment.center,
           children :[
             Row(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,children: [

               AnimatedContainer(height: 200,
                   duration: const Duration(seconds: 2),padding: EdgeInsets.all(isClicked?40 :0),
                   child: ClipRRect(borderRadius: const BorderRadiusDirectional.only(topEnd: Radius.circular(90),topStart:  Radius.circular(40),bottomStart:  Radius.circular(40),bottomEnd:  Radius.circular(40)), child: Image(image: Image.asset("images/unsplash.jpg").image))
               ),
               AnimatedContainer(height: 200,
                   duration: const Duration(seconds: 1),padding: EdgeInsets.all(isClicked?0:40),
                   child: ClipRRect(borderRadius:  const BorderRadiusDirectional.only(topEnd: Radius.circular(90),topStart:  Radius.circular(40),bottomStart:  Radius.circular(40),bottomEnd:  Radius.circular(40)), child: Image(image: Image.asset("images/unsplash.jpg").image))
               )
             ]),

           //  Padding(padding: const EdgeInsets.only(top: 30),child: stylistText("Welcome to Flutter"),),
           //  Padding(padding: const EdgeInsets.all(5),child: stylistText(str)),
             Visibility(visible: iscompleted, child:  Padding(padding: const EdgeInsets.only(top: 30), child: InkWell(
               onTap:() async {
                 setState(()  {
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Hello")));

                   if(isClicked) {
                     isClicked = false;

                   } else {
                     isClicked = true;
                   }

                 });
                 if(isClicked){
                   await Future.delayed( const Duration(seconds: 3));
                   // navigate to next screen and called onResume method of this screen.
                   Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginPage())).then((value) => {didChangeAppLifecycleState(AppLifecycleState.resumed)});}

               } ,
               child: Wrap(children: [AnimatedContainer(duration: const Duration(milliseconds: 600),alignment:Alignment.center,width: isClicked?50:170 ,height: 30,decoration: BoxDecoration(color: Colors.deepOrange,borderRadius: BorderRadius.circular(isClicked ? 50 : 10)),child: isClicked ? const Icon(Icons.done,color: Colors.white,) : const Text("Go to next page"),)]),),)),


           ]
       ));
  }


  Future<void> splashDelay() {
    return Future.delayed(const Duration(seconds: 3),() {
      showCounting("");
        });
  }



  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    isClicked = false;
    //splashDelay();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    timer?.cancel();
    
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if(state == AppLifecycleState.resumed){
      setState(() {
        isClicked = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Resumed")));
    }
  }



}

 