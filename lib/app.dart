import 'dart:ui';import 'package:aerial/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'base/server_configs/config.dart';

class AerialApp extends StatelessWidget {
  const AerialApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child:MultiProvider(
        providers: [
          AppProviders.shared.authProvider,
          AppProviders.shared.lendingProvider,
          AppProviders.shared.tabProvider,
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return  MaterialApp.router(
              key: kNavigatorKey,
              debugShowCheckedModeBanner: false,
              title: 'Aerial',
              routerConfig: RouteConfig.goRouterMainRouter ,
              scrollBehavior: MyCustomScrollBehavior(),
              theme: appTheme(context),
              builder: (context, child) {
                final MediaQueryData data = MediaQuery.of(context);
                return MediaQuery(
                  data: data.copyWith(
                      textScaler: const TextScaler.linear(1.0)
                  ),
                  child: child ?? Container(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
