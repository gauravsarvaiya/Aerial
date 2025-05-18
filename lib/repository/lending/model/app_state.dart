class AppState {
  final bool isLogin;
  String? userID;
  String? memberID;
  String? token;

  AppState({
    required this.isLogin,
    this.userID,
    this.memberID,
    this.token,
  });
}