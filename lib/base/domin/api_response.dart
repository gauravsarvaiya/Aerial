

import '../../utils/utils.dart';

class AppResponse<T> {
  Status? state;
  T? data;
  String? msg;

  AppResponse();

  AppResponse.loading(this.msg) : state = Status.loading;

  AppResponse.completed(this.data) : state = Status.completed;

  AppResponse.error(this.msg) : state = Status.error;

  AppResponse.unAuthorized(this.msg): state = Status.unAuthorised;

  @override
  String toString() {
    return "Status : $state \n Message : $msg \n Data : $data";
  }
}
