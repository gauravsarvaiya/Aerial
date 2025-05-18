
import '../../../utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../presentation/profile_screen.dart';


class ProfileRoute{

  static const String profileName = "profile";

  static const String changePasswordRoute = "change_password";

  static const String viewCmsName = "view_cms";

  // ================================================================== //

  static GoRoute profileGoRoute = GoRoute(
    path: "/profile",
    name: profileName,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        child: const ProfileScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      );
    },
    routes: [

    ]
  );

  // =============================================================================

  static goToProfilePage({required BuildContext context}){
    RouteConfig.goPushReplacementNamed(context: context, name: profileName);
  }

  static goToWebView({required BuildContext context, Map<String, dynamic>? queryParameters}){
    RouteConfig.goPushNamed(context: context, name: viewCmsName,
        queryParameters: queryParameters
    );
  }

}