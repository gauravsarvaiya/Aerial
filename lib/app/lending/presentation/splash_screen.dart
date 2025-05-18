import 'package:aerial/utils/utils.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).width / 3,
              width: MediaQuery.sizeOf(context).width / 3.5,
              child: Image.asset("assets/images/logo.png"),
            ),
            SizedBox(height: 20.sp,),
            Text("Welcome Aerial",
              textAlign: TextAlign.center,
              style: TextStyle(color: kWhiteColor,fontWeight: FontWeight.w600,fontSize: 20),),
            SizedBox(height: 20.sp,),
            SizedBox(
              height: 24.sp,
              width: 24.sp,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: kWhiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}