
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var splashImage =  Image.asset("unsplash.jpg");

Widget stylistText(string,{maxLinee  = 2}){
  
  return Text(string,textAlign: TextAlign.center,maxLines: maxLinee,style: const TextStyle(fontSize: 20,fontStyle: FontStyle.italic) ,);
}

Widget ImageVieew(imageName){
  return Image(image: Image.asset(imageName).image,);
}





Widget createCardRow(String string1, String string2){
  return Card(child: Row(children: [
    stylistText(string1),
    stylistText(string2)
  ],),);
}