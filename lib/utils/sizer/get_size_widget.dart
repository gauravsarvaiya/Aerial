import 'package:flutter/cupertino.dart';

import '../utils.dart';

class GetSizedData{

 static bool webSize(BuildContext context){
    final size = MediaQuery.sizeOf(context);
    if(size.width > 800){
      return true;
    }else{
      return false;
    }
  }

  static int itemCount(BuildContext context){
    final size = MediaQuery.sizeOf(context);
    if(size.width < 900){
      return 1;
    }else if(size.width < 1400){
      return  2;
    }else{
      return 3;
    }

  }

}