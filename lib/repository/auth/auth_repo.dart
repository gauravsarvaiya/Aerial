import '../../base/server_configs/config.dart';
import '../../utils/utils.dart';

abstract class IAuthRepository {
  Future<dynamic>loginRepo({required dynamic data});
}

class AuthRepo extends IAuthRepository {

  @override
  Future<dynamic> loginRepo({required dynamic data}) async{

    final response = await WebService.instance.post(request: NetworkRequest(
        url: loginUrl,
        data: data
     )
    );
    return await response;
  }


}