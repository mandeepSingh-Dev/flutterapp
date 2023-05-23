
import 'dart:convert';
import 'dart:developer';
import 'dart:isolate';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapptwo/Constants.dart';
import 'package:flutterapptwo/Data/ContentsViewmodel.dart';
import 'package:flutterapptwo/Data/ContetsRepository/ContentsRepository.dart';
import 'package:flutterapptwo/Data/model/Hits.dart';
import 'package:flutterapptwo/Data/model/UserData.dart';
import 'package:flutterapptwo/Utils.dart';
import 'package:flutterapptwo/WallpaperScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'LoginDashboardArguments.dart';

class Dashboard extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => DashBoardList();
}

class DashBoardList extends State<Dashboard>{

  ContentsViewmodel? contentViewmodel;
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 1),() => contentViewmodel?.getContent());
    /*  Isolate.spawn<int>((message) {
      print("skfndfdf");
      Future.delayed(Duration(seconds: 2),(){
      contentViewmodel?.getContent();
      });

    }, 4).then((value) => print("djkfbnjdfd"));*/
  }

  @override
  Widget build(BuildContext context) {





    contentViewmodel = context.watch<ContentsViewmodel>();

    return Scaffold(
        appBar:VxAppBar(title: Text("Content Viewmodel")),
        body:Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.white10,Colors.black87])),width: MediaQuery.of(context).size.width,
          child:Padding(padding:  EdgeInsets.only(left: 14,right: 14,top: 12),
            child: Column(verticalDirection: VerticalDirection.down,children: [
              Expanded(flex:0,child: GestureDetector(onTap: ()=> contentViewmodel?.getContent(),child: Card(margin:EdgeInsets.only(bottom: 10),clipBehavior:Clip.antiAlias, shape: RoundedRectangleBorder(side: const BorderSide(color:Colors.deepOrange,width: 1), borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(child: Image(height:100,width:MediaQuery.of(context).size.width,image: Image.network(contentViewmodel?.dataa?.hits?.first?.largeImageURL ?? "").image,fit: BoxFit.fill,)))
              ),
              ),
              Expanded(child:
              ListView.builder(/*gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,crossAxisSpacing: 5),clipBehavior: Clip.antiAlias,padding: EdgeInsets.only(bottom: 20),*/ itemCount: contentViewmodel?.dataa?.hits?.length!=0?contentViewmodel?.dataa?.hits?.length:10  ,itemBuilder:(context,index){
                Widget? widget;

                if(contentViewmodel?.dataa?.hits?.elementAt(index).alphabet != null){
                  widget = Card(
                      clipBehavior:Clip.antiAlias,
                      margin: EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
                      elevation:4, shadowColor: Colors.orange,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(color: Colors.white,width: 1.4)),
                      child: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.purple,Colors.lightBlue])),
                        child: Padding(padding: EdgeInsets.only(top: 17,bottom: 17,left: 22),child: Text(contentViewmodel?.dataa?.hits?.elementAt(index)?.alphabet?.toUpperCase() ?? "",style: GoogleFonts.arsenal(color: Colors.white,fontSize: 20)),),)
                  );
                }else {
                  widget = SizedBox(height: 300,
                    child: GestureDetector(
                        onTap: () => contentViewmodel?.getContent(),
                        child: Card(clipBehavior: Clip.antiAlias,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          color: index % 3 == 0 ? Colors.red : Colors
                              .lightGreenAccent,
                          child: Column(children: [
                            Expanded(child: Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  clipBehavior: Clip.antiAlias,
                                  child: GestureDetector(onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => WallpaperScreen(hits:contentViewmodel?.dataa?.hits?.elementAt(index) ?? Hits.initt())));
                                  },
                                    child: Image(height: 600,
                                      width: double.infinity,
                                      image: Image
                                          .network(contentViewmodel?.dataa?.hits
                                          ?.elementAt(index)
                                          ?.largeImageURL ?? "")
                                          .image,
                                      fit: BoxFit.fill,),)
                              ),)),
                            Padding(padding: EdgeInsets.only(
                                bottom: 10, left: 6, right: 6),
                                child: Text(
                                    "Username: ${ contentViewmodel?.dataa?.hits
                                        ?.elementAt(index)
                                        ?.user ?? "Username is Empty"}")),
                          ],),
                        )
                    ),);
                }
                return widget;
              }),
              )]
              ,)
        ,)
    )
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
    }
    else if(contentViewmodel?.sealedClass is MyError){
      var error = contentViewmodel?.sealedClass as MyError;

      return Padding(padding: EdgeInsets.only(top: 15),child:
      Container(
        child:  Row(mainAxisSize:MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,children:  [
          Text(error.errorMessage.toString(),style: TextStyle(color: Colors.white),)
        ],),));
    }
    else if(contentViewmodel?.sealedClass is Loading){
      return Padding(padding: EdgeInsets.only(top: 15),child:
      Container(
        child:  Row(mainAxisSize:MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,children:  const [
          Text("Loading",style: TextStyle(color: Colors.white),)
        ],),));
    }
    else{
      return Padding(padding: EdgeInsets.only(top: 15),child:
      Container(
        child:  Row(mainAxisSize:MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,children:  const [
          Text("Finished",style: TextStyle(color: Colors.white),)
        ],),));
    }
  }

  getData() {
     contentViewmodel?.getContent();
  }

  getUserData() async{
     var r = await getSharedPrefercneString(Constants.USERDATA);
     print("dfhdkfjndfd: $r");
     var mapJson = JsonDecoder().convert(r) as Map<String,dynamic>;
    var userData =  UserData.getInstance().fromJson(mapJson);
    print("dkfhjdfhjdf: ${userData.tojson().toString()}");
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(userData.firstName+value)));
  }

}

// index%3==0? Colors.red : Colors.lightGreenAccent