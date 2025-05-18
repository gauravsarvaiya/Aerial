import 'dart:io';
import 'package:aerial/app/lending/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import '../../auth/presentation/login/presentation/login_screen.dart';
import '../../home/presentation/home_screen.dart';
import '../../tab/presentation/tab_screen.dart';
import '../application/lending_provider.dart';

class LendingPage extends StatefulWidget {
  final String? path;
  const LendingPage({super.key, this.path});

  @override
  State<LendingPage> createState() => _LendingPageState();
}

class _LendingPageState extends State<LendingPage> with WidgetsBindingObserver {

  bool isShowPage = false;
  bool underMaintenance = false;


  @override
  void initState() {
    super.initState();
    print("======= Lending Page ======== ");

  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lendingProvider = context.watch<LendingProvider>();
    final appState = lendingProvider.appState;

    if((appState?.isLogin == null)) {
      return const SplashScreen();
    }


    if(!kIsWeb) {
      if(appState?.isLogin == true) {
        return TabScreen(path: '/home',
          child:  HomeScreen(
            context: context,
          ),
        );
      } else {
        return const LoginScreen();
      }
    }else{
      return SizedBox.shrink();
    }

  }
}


