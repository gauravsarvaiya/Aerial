import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/utils.dart';
import '../presentation/home_screen.dart';

class HomeRoute {

  static const String homeName = "home";

  static const String homeDataName = "homeData";

  // ================================================================== //

  static GoRoute homeGoRoute = GoRoute(
    path: "/home",
    name: homeName,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        child: HomeScreen(
          context: context,
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

  static goToHomePage({required BuildContext context}){
    RouteConfig.goPushReplacementNamed(context: context, name: homeName);
  }

  static goToHomeDataPage({required BuildContext context, Map<String, dynamic>? queryParameters}){
    RouteConfig.goPushNamed(
        context: context, name: homeDataName,
        queryParameters: queryParameters
    );
  }


}