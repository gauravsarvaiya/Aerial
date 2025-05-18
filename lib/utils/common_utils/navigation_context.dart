part of utils;

class NavigationService {
  static GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
  static BuildContext? get globalContext => rootNavigatorKey.currentState?.context;
}