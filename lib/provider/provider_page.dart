import 'package:flutter/cupertino.dart';

class Provider_class extends ChangeNotifier{
  List _favName=[];
  List _favImg=[];
  List get favoriteName=>_favName;
  List get favoriteImage=>_favImg;

  void favorites(String item,String image){
    final favoriteNameList=_favName.contains(item);
    if(favoriteNameList){
      _favName.remove(item);
      _favImg.remove(image);
    }else{
      _favName.add(item);
      _favImg.add(image);
    }
    notifyListeners();
  }
  bool icn_change(String icnName){
    final favIcn=_favName.contains(icnName);
    return favIcn;
  }
}