import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../utils/utils.dart';
import '../presentation/login/presentation/login_screen.dart';

class AuthRoute {

  static const String logInName = "logIn";

  static const String signUpName = "homeData";

  // ================================================================== //


  static GoRoute authGoRoute = GoRoute(
    parentNavigatorKey: NavigationService.rootNavigatorKey,
    path: "/logIn",
    name: logInName,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        child:  const LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      );
    },
    routes: [
      // GoRoute(
      //   path: "homeData",
      //   name: homeDataName,
      //   pageBuilder: (context, state) {
      //     return CustomTransitionPage(
      //       child:  HomeData(
      //         id: state.uri.queryParameters['id'],
      //       ),
      //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //         return FadeTransition(
      //           opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
      //           child: child,
      //         );
      //       },
      //     );
      //   },
      // ),
    ],
  );

  // =============================================================================

  static goToSignInPage({required BuildContext context}){
    RouteConfig.goPushNamed(context: context, name: logInName);
  }

  // static goToHomeDataPage({required BuildContext context, Map<String, dynamic>? queryParameters}){
  //   RouteConfig.goNamed(
  //       context: context, name: homeDataName,
  //       queryParameters: queryParameters
  //   );
  // }


}