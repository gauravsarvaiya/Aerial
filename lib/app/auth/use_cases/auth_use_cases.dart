import 'dart:convert';

import '../../../repository/auth/auth_repo.dart';
import '../presentation/login/model/login_response_model.dart';

abstract class IAuthUseCases {
  Future<LoginResponseModel>loginInCase({required String emailId,required String password}) ;
}

class AuthUseCases extends IAuthUseCases {
  final AuthRepo? authRepo;

  AuthUseCases({this.authRepo});

  @override
  Future<LoginResponseModel> loginInCase({required String emailId,required String password}) async{

    final res = await authRepo?.loginRepo(data: {
      "username": emailId, "password":password
    });

    final decoded = res is String ? jsonDecode(res) : res;

    return LoginResponseModel.fromJson(decoded);
  }
}