import '../../utils/utils.dart';
import 'model/app_state.dart';

abstract class ILendingRepository {
  Future<AppState> getAppState();
  Future setAppState({required AppState state});
  Future clearAppState();
}

class LendingRepository extends ILendingRepository {

  SecureStorage secureStorage = SecureStorage();

  @override
  Future<AppState> getAppState() async {

    final isLogin = await UserPrefs.shared.getIsLogin;

    if(isLogin) {
      await secureStorage.setStaticValues();
    }

    return AppState(isLogin: isLogin, memberID: SecureStorage.memberID, token: SecureStorage.token, userID: SecureStorage.userID);

  }

  @override
  Future setAppState({required AppState state}) async {

    await UserPrefs.shared.setIsLogin(isLogin: state.isLogin);
    await secureStorage.setMemberId(memberID: state.memberID);
    await secureStorage.setToken(token: state.token);
    await secureStorage.setUserId(userID: state.userID);
    await secureStorage.setStaticValues();

  }

  @override
  Future clearAppState() async {

    await UserPrefs.shared.clear();
    await secureStorage.clear();

  }
}