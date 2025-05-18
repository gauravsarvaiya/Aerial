part of utils;

class SecureStorage {
  static FlutterSecureStorage storage =  const FlutterSecureStorage();
  static String? userID;
  static String? memberID;
  static String? token;

  final String _tokenKey = "user_token";
  final String _userIdKey = "user_id";
  final String _memberIdKey = "member_id";

  //  GET
  Future<String?> getUserId() async {
    return await storage.read(key: _userIdKey);
  }

  Future<String?> getMemberId() async {
    return await storage.read(key: _memberIdKey);
  }

  Future<String?> getToken() async {
    return await storage.read(key: _tokenKey);
  }

  // SET
  setUserId({required String? userID}) async {
    await storage.write(key: _userIdKey, value: userID);
  }

  setMemberId({required String? memberID}) async {
    await storage.write(key: _memberIdKey, value: memberID);
  }

  setToken({required String? token}) async {
    await storage.write(key: _tokenKey, value: token);
  }

  setStaticValues() async {
    SecureStorage.userID = await getUserId();
    SecureStorage.token = await getToken();
    SecureStorage.memberID = await getMemberId();
  }

  // Checks
  Future<bool> get isUserAvailable async => await getUserId() != null;

  Future<bool> get isMemberId async => await getMemberId() != null;

  Future<bool> get isTokenSet async => await getToken() != null;

  // Delete
  Future clear() async {
    SecureStorage.userID = null;
    SecureStorage.token = null;
    SecureStorage.memberID = null;
    await storage.deleteAll();
  }

}