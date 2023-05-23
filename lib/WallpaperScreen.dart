import 'package:flutter/material.dart';
import 'package:flutterapptwo/Data/model/Hits.dart';
import 'package:flutterapptwo/WallpaperScreen.dart';

class WallpaperScreen extends StatelessWidget{
  const WallpaperScreen({ super.key, required this.hits});

  final Hits hits;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      child: SafeArea(child:
    Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.orange,Colors.cyanAccent],begin: Alignment.center))
        ,child: Padding(padding: EdgeInsets.all(20),child:
        Column(children:  [
          ClipRRect(borderRadius: BorderRadius.circular(25),child: Image(image: Image.network(hits.largeImageURL ?? "").image)),
        SizedBox(height: 10),
       Expanded(child:  SingleChildScrollView(child: Column(children: [
         getDynamicCardTextView(hits,"Image URL")
         ,        getDynamicCardTextView(hits,"Image URL"),        getDynamicCardTextView(hits,"Image URL"),
         getDynamicCardTextView(hits,"Image URL"),
         getDynamicCardTextView(hits,"Image URL")

       ],),))
        ],),)
        )
      )

    ),);
  }

}

Widget getDynamicCardTextView(Hits  hits, String title){
  return Card( clipBehavior: Clip.antiAlias,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(padding: EdgeInsets.all(20),
        child:Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
          SizedBox(height: 7,),
          Text(hits.largeImageURL ?? ""),
          SizedBox(height: 20,)
        ],)
  )
  );

}