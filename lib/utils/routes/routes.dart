part of utils;

class RouteConfig {

  static String initialPath = "/";
  static String authInitialPath = "/logIn";
  static String tabInitialPath = "/home";

  static GoRouter goRouterMainRouter = GoRouter(
    navigatorKey: NavigationService.rootNavigatorKey,
    initialLocation: '/',
    routes: [
      LendingRoute.lendingGoRoute,
      AuthRoute.authGoRoute,
      TabRoute.mainTabRouter,

    ],
    redirect: (context, state) async {

      if(kIsWeb) {
        final tabProvider = context.read<TabProvider>();
        final isLogin = await UserPrefs.shared.getIsLogin;
        final path = state.uri.path;
        final isCheckPath = state.uri.path.split("/").last;
        switch(isCheckPath){

          case HomeRoute.homeName:
            tabProvider.tabChangeIndex(index: 0);
            if(isLogin){
              return path;
            }else{
              return authInitialPath;
            }
            break;

          // case SpareRoute.spareName:
          //   tabProvider.tabChangeIndex(index: 1);
          //   if(isLogin){
          //     return path;
          //   }
          //   break;

          // case SparesInquiryRoute.sparesInquiryName:
          //   tabProvider.tabChangeIndex(index: 2);
          //   if(isLogin){
          //     return path;
          //   }
          //   break;

          // case ServiceTicketsRoute.serviceTicketsName:
          //   tabProvider.tabChangeIndex(index: 3);
          //   if(isLogin){
          //     return path;
          //   }
          //   break;

          case "":
            if(!isLogin){
              return authInitialPath;
            }else{
              return "/${HomeRoute.homeName}";
            }

          case "logIn":


            print("=================IsLoginSide================================");
            print("isLogin : $isLogin");
            print("isCheckPath : $isCheckPath");
            print("path : $path");
            print("=================================================");

            if(!isLogin){
              return authInitialPath;
            }else{
              return "/${HomeRoute.homeName}";
            }
        }
      }else{

      }

      return null;

    },
  );

  static goPushNamed({required BuildContext context, required String name, Map<String, String>? pathParameters, Map<String, dynamic>? queryParameters, Object? extra}) {
    // context.pushNamed(name,

    if(kIsWeb){
      context.goNamed(name,
          queryParameters: queryParameters ?? <String, dynamic>{},
          pathParameters: pathParameters ?? <String, String>{},
          extra: extra
      );
    }else {
      context.pushNamed(name,
          queryParameters: queryParameters ?? <String, dynamic>{},
          pathParameters: pathParameters ?? <String, String>{},
          extra: extra
      );
    }


  }

  static goPushReplacementNamed(
      {required BuildContext context, required String name, Map<String, String>? pathParameters, Map<String,
          dynamic>? queryParameters, Object? extra}) {

    if(kIsWeb){
      context.goNamed(name,
          queryParameters: queryParameters ?? <String, dynamic>{},
          pathParameters: pathParameters ?? <String, String>{},
          extra: extra
      );
    }else{
      context.pushReplacementNamed(name,
          queryParameters: queryParameters ?? <String, dynamic>{},
          pathParameters: pathParameters ?? <String, String>{},
          extra: extra
      );
    }
  }


  static goFirstPopNamed({required BuildContext context, required String name}) {
    while (context.canPop()) {
      context.pop();
    }
    context.pushReplacement(name);
  }

}