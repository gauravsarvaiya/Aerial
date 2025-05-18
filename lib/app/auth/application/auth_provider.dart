
import '../../../base/domin/api_response.dart';
import '../../../base/domin/base_notifier.dart';
import '../presentation/login/model/login_response_model.dart';
import '../use_cases/auth_use_cases.dart';

abstract class IAuthProvider {
  Future logIn({required String? emailId,required String? password});
}

class AuthProvider extends BaseNotifier implements IAuthProvider {
  final IAuthUseCases authUseCases;

  late AppResponse<LoginResponseModel> _loginResponse;
  AppResponse<LoginResponseModel> get loginResponse => _loginResponse;

  AuthProvider({required this.authUseCases}){
    _loginResponse = AppResponse();
  }

  @override
  Future logIn({required String? emailId, required String? password}) async{
    try{
      resIsLoading(_loginResponse);

      final res = await authUseCases.loginInCase(emailId: emailId ?? "",password: password ?? "");

      print("$res ====  Login response ");

      resIsSuccess(_loginResponse, res);

    }catch(error){
      resIsFailed(_loginResponse, error);

      rethrow;
    }
  }
}