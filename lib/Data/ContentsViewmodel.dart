import 'package:flutter/cupertino.dart';
import 'package:flutterapptwo/Data/ContetsRepository/ContentsRepository.dart';

class ContentsViewmodel extends ChangeNotifier{

  ContentsRepository repository;
  SealedClass? sealedClass = Loading();

  ContentsViewmodel(this.repository);

  setNotify(SealedClass sealedClass){
    this.sealedClass = sealedClass;
    notifyListeners();
  }

  void getContent(){
    var r = repository.getContents();
    r.then((value) => {
      if(value is Loading){
        setNotify(value)
      }else if(value is Success){
        setNotify(value)
      }else{
        setNotify(value)
      }
    });

  }


}