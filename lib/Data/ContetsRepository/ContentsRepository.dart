
import 'package:dio/dio.dart';
import 'package:flutterapptwo/Data/ContetsRepository/ContentsRepository.dart';
import 'package:flutterapptwo/Data/model/PixabayData.dart';

class ContentsRepository{
  Dio? dio;


  ContentsRepository(){
    dio = Dio(BaseOptions(baseUrl: "https://pixabay.com/api/?17284571-9dc44bcf97e2f82106c65a55e"));
  }
  SealedClass? sealedClass;
  
  Future<SealedClass> getContents() async{

    try {
      sealedClass = Loading();
      var response = await dio?.get("");
      if(response?.statusCode ==200){
        sealedClass = Success(response?.statusMessage, response);
        return sealedClass!;
      }else{
        sealedClass = Error(response?.statusMessage);
        return sealedClass!;
      }
    } catch(e){
      sealedClass = Error(e.toString());
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

class Error extends SealedClass {
  String? errorMessage;
  Error(this.errorMessage);
}