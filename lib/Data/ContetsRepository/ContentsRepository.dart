
import 'package:dio/dio.dart';
import 'package:flutterapptwo/Data/ContetsRepository/ContentsRepository.dart';
import 'package:flutterapptwo/Data/model/PixabayData.dart';

class ContentsRepository{
  Dio? dio;


  ContentsRepository(){
    dio = Dio(BaseOptions(baseUrl: "https://pixabay.com/"));
  }
  SealedClass? sealedClass;
  
  Future<SealedClass> getContents() async{

    try {
      sealedClass = Loading();
      var response = await dio?.get("api/?17284571-9dc44bcf97e2f82106c65a55e");
      if(response?.statusCode ==200){
        sealedClass = Success(response?.statusMessage, response);
        return sealedClass!;
      }else{
       // sealedClass = MyError(response?.statusMessage);
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

class Success<T> extends SealedClass{
  String? message;
  T data;

  Success(this.message,this.data);
}


class MyError extends SealedClass {

  String? errorMessage;

  MyError(this.errorMessage);
}

class H extends SealedClass{}