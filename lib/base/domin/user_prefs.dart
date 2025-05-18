
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs{

  static UserPrefs shared = UserPrefs();

  bool? isLogin;

  UserPrefs() {
    updateData();
  }

  updateData() async {
    isLogin = await _getIsLogin();
  }

  Future setFCMToken({required String token})async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('IS_FCM_TOKEN', token);
  }

  Future setIsLogin({required bool isLogin}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('IS_USER_LOGIN', isLogin);
    this.isLogin = isLogin;
  }

  Future setONBoardingIsLogin({required bool isLogin}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('IS_ON_BOARDING', isLogin);
    this.isLogin = isLogin;
  }

  /* Future<bool> clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogin = null;
    return await prefs.clear();
  }*/

  Future<bool> clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogin = null;
    final isLog = await prefs.remove("IS_USER_LOGIN");
    final isToken = await prefs.remove("IS_FCM_TOKEN");
    return (isLog || isToken);
    // return await prefs.clear();
  }

  removeLogin() async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("IS_USER_LOGIN");
    isLogin = null;
  }

  // Get User here
  Future<bool> get getIsLogin => _getIsLogin();

  Future<String> get getFcmToken => _getFCMToken();
  Future<bool> get getOnBoarding => _getOnBoarding();

  Future<String> _getFCMToken()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("IS_FCM_TOKEN") ?? "";
  }
  Future<bool> _getOnBoarding()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("IS_ON_BOARDING") ?? false;
  }

  Future<bool> _getIsLogin() async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    isLogin = prefs.getBool('IS_USER_LOGIN') ?? false;

    return isLogin ?? false;
  }

}

class LocalUser{
  final bool? isLogin;

  LocalUser(
      {this.isLogin});

}

