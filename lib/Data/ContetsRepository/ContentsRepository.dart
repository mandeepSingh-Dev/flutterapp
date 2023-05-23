
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterapptwo/Data/ContetsRepository/ContentsRepository.dart';
import 'package:flutterapptwo/Data/model/PixabayData.dart';

class ContentsRepository{
  Dio? dio;


  ContentsRepository(){
    dio = Dio();
  }
  SealedClass? sealedClass;
  
  Future<SealedClass> getContents() async{

    try {
      sealedClass = Loading();

      var response = await dio?.get("https://pixabay.com/api?key=17284571-9dc44bcf97e2f82106c65a55e&per_page=100");

      if(response?.statusCode == 200){
       // debugPrint("edefd");
     //   print("dkfkndjkfndkfnd ${PixabayData.fromJson(response?.data?.toString()).total}");
        var mapData = response?.data as Map<String,dynamic>;
        var pd = PixabayData.fromJson(mapData);

        sealedClass = Success(response?.statusMessage, pd );

      //  print("DATA YE HAI ${response?.data.toString()}");

     //   print("DATA YE PIXA HAI ${(response?.data as PixabayData).toString()}");
        return sealedClass!;
      }else{
        sealedClass = MyError(response?.statusMessage);
        return sealedClass!;
      }
    } catch(e){
      sealedClass = MyError(e.toString());
      return sealedClass!;
    }
    }

}

class SealedClass{

}

class Loading extends SealedClass{

}

class Success extends SealedClass{
  String? message;
  PixabayData data;

  Success(this.message,this.data);
}


class MyError extends SealedClass {

  String? errorMessage;

  MyError(this.errorMessage);
}

class H extends SealedClass{}