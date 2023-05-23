import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutterapptwo/Data/ContetsRepository/ContentsRepository.dart';
import 'package:flutterapptwo/Data/model/PixabayData.dart';
import 'package:velocity_x/velocity_x.dart';

class ContentsViewmodel extends ChangeNotifier{

  ContentsRepository repository;
  SealedClass? sealedClass = null;

  PixabayData? dataa;

  int count = 0;


  void increment(){
    count++;
    notifyListeners();
  }

  ContentsViewmodel(this.repository);

  setNotify(SealedClass sealedClass){
    this.sealedClass = sealedClass;
    notifyListeners();
  }

  notifyPixabayData(PixabayData pixabayData){
    dataa = pixabayData;

    String? previousAlphabet = "";
    String? currentAlphabet = "";
    dataa?.hits?.sort((a,b) => a.user!.toLowerCase().compareTo(b.user!.toLowerCase()));
    print("dkmnmkvnfv ${dataa?.hits?.length.toString()}");



    dataa?.hits?.forEach((element) {
      print("kdkfnkdv  ${element.user}");

      currentAlphabet = element.user?.characters.first.toLowerCase();

      if (previousAlphabet?.isEmpty == true){
        previousAlphabet = element.user?.characters.first.toLowerCase();
        element?.alphabet = previousAlphabet;

      }else{
          if(previousAlphabet != currentAlphabet) {
            previousAlphabet = element.user?.characters.first.toLowerCase();
            element?.alphabet = previousAlphabet;
          }
      }
    });

    dataa?.hits?.forEach((element) {
      print("dkvknkvdf ${element.user}  ${element.alphabet}");
    });
    notifyListeners();
  }

  void getContent(){
    setNotify(Loading());
    Future.delayed(Duration(seconds: 1),(){

      var response = repository.getContents();

      response.then((value) => {
        if(value is Loading){
          setNotify(value)
        }else if(value is Success){

          notifyPixabayData( value.data) ,
          setNotify(value)
        }else{
          setNotify(value)
        }
      });
    });



  }


}