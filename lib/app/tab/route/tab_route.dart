import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/utils.dart';
import '../../home/route/home_route.dart';
import '../../profile/route/profile_route.dart';
import '../presentation/tab_screen.dart';


class TabRoute {

  static String tabName = "home";

  // =====================================================================

  static ShellRoute mainTabRouter = ShellRoute(
    navigatorKey: NavigationService.shellNavigatorKey,
    builder: (context, state, child) {
      print("main ===  ${state.uri}");
      return TabScreen(
        context: context,
        path: "${state.uri}",
        child: child,
      );
    },
    routes: [
      HomeRoute.homeGoRoute,
      ProfileRoute.profileGoRoute,

    ],
  );

  // =====================================================================

  static goToTabPage(BuildContext context){
    RouteConfig.goPushNamed(context: context, name: tabName);
  }

}