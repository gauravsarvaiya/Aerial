import 'package:flutter/foundation.dart';
import '../../utils/utils.dart';
import '../domin/api_response.dart';

class BaseNotifier extends ChangeNotifier{

  resIsLoading(AppResponse res){

    res.state = Status.loading;

    notifyListeners();
  }

  resIsSuccess<T>(AppResponse res,T data){

    res.state = Status.completed;

    res.data = data;

    notifyListeners();
  }

  resIsFailed(AppResponse res,Object e){

    res.state = Status.error;

    res.msg = e.toString();

    res.data = null;

    notifyListeners();
  }

  resIsUnauthorized(AppResponse res){

    res.state = Status.unAuthorised;

    res.data = null;

    notifyListeners();
  }


}