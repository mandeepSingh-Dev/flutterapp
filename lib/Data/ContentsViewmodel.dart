import 'package:flutter/cupertino.dart';
import 'package:flutterapptwo/Data/ContetsRepository/ContentsRepository.dart';

class ContentsViewmodel extends ChangeNotifier{

  ContentsRepository repository;
  SealedClass? sealedClass = Loading();

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

  void getContent(){
    setNotify(Loading());
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