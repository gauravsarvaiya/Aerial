import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/utils.dart';
import '../presentation/lending_page.dart';
import '../presentation/splash_screen.dart';


class LendingRoute {

  static const String lendingName = "lending";

  static const String splashName = "splash";

  // ================================================================== //

  static GoRoute lendingGoRoute = GoRoute(
    path: "/",
    name: lendingName,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        child: LendingPage(
          path: state.uri.path,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      );
    },
    routes:[
      GoRoute(
        path: "splash",
        name: splashName,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: SplashScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
    ]
  );

  // =============================================================================

  static goToLendingNamePage({required BuildContext context}){
    RouteConfig.goPushNamed(context: context, name: lendingName);
  }

  static goToSplashPage({required BuildContext context, Map<String, dynamic>? queryParameters}){
    RouteConfig.goPushNamed(
        context: context, name: splashName,
        queryParameters: queryParameters
    );
  }


}
