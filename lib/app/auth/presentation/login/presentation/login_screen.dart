import 'package:aerial/utils/utils.dart';
import 'package:flutter/material.dart';
import 'components/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    if(size.width > SizerUtil.iPadWidth) {
      return Scaffold(
        backgroundColor: kSecondaryColor,
        body: Row(
          children: [
            if (size.width >= 720)
              Container(
              width: MediaQuery.of(context).size.width /2,
              height: MediaQuery.of(context).size.height,
              color: kPrimaryColor,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children:[
                    Container(
                      width: getRadialData(context).firstRing,
                      height: getRadialData(context).firstRing,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(colors: [
                          Colors.white10,
                          kPrimaryColor
                        ],
                            tileMode: TileMode.decal,
                            focalRadius: 10.sp
                        ),
                        border: Border.all(
                          color: Color(0xffFFE4AF),
                          width: 2.sp,
                        ),
                      ),
                    ),
                    Container(
                      width: getRadialData(context).second,
                      height: getRadialData(context).second,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(colors: [
                          Colors.white10,
                          kPrimaryColor
                        ],
                            tileMode: TileMode.decal,
                            focalRadius: 10.sp
                        ),
                        border: Border.all(
                          color: Color(0xffFFE4AF),
                          width: 2.sp,
                        ),
                      ),
                    ),
                    Container(
                      width: getRadialData(context).thirdRing,
                      height: getRadialData(context).thirdRing,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(colors: [
                          Colors.white10,
                          kPrimaryColor
                        ],
                            tileMode: TileMode.decal,
                            focalRadius: 10.sp
                        ),
                        border: Border.all(
                          color: Color(0xffFFE4AF),
                          width: 2.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getRadialData(context).imageHeight,
                        width: getRadialData(context).imageWidth,
                        child: Image.asset("assets/images/device_img.png")),
                  ]
                ),
              ),
            ),
              SizedBox(
              width: MediaQuery.of(context).size.width /2,
              height: MediaQuery.of(context).size.height,

              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: getResponsivePadding(context),
                        ),
                          child: const LoginForm())
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(body: SingleChildScrollView(
      padding: EdgeInsets.all(15.sp),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.1,left: getResponsivePadding(context),right: getResponsivePadding(context)),
          child: LoginForm(),
        ),
      ),
    ));
  }

  double getResponsivePadding(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= 1350) {
      return 160.sp;

    } else if (screenWidth >= 1150) {
      return 130.sp;

    } else if (screenWidth >= 1100) {
      return 120.sp;

    } else if (screenWidth >= 1000) {
      return 95.sp;

    }else if (screenWidth >= 900) {
      return 60.sp;

    }else if (screenWidth >= 800) {
      return 30.sp;
    } else {
      return 16.sp;
    }
  }

  ResponsiveData getRadialData(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= 1350) {
      return ResponsiveData(
          firstRing: 480.sp,
          second: 398.sp,
          thirdRing: 316.sp,
          imageHeight: 252.sp,
          imageWidth: 228.sp
      );

    } else if (screenWidth >= 1150) {
      return ResponsiveData(
          firstRing: 450.sp,
          second: 378.sp,
          thirdRing: 286.sp,
          imageHeight: 232.sp,
          imageWidth: 208.sp
      );

    } else if (screenWidth >= 1100) {
      return ResponsiveData(
          firstRing: 450.sp,
          second: 378.sp,
          thirdRing: 286.sp,
          imageHeight: 232.sp,
          imageWidth: 208.sp
      );

    } else if (screenWidth >= 1000) {
      return ResponsiveData(
          firstRing: 420.sp,
          second: 358.sp,
          thirdRing: 266.sp,
          imageHeight: 202.sp,
          imageWidth: 188.sp
      );

    }else if (screenWidth >= 900) {
      return ResponsiveData(
          firstRing: 390.sp,
          second: 328.sp,
          thirdRing: 246.sp,
          imageHeight: 182.sp,
          imageWidth: 168.sp
      );

    }else if (screenWidth >= 800) {
      return ResponsiveData(
          firstRing: 340.sp,
          second: 280.sp,
          thirdRing: 200.sp,
          imageHeight: 162.sp,
          imageWidth: 128.sp
      );
    } else {
      return ResponsiveData(
          firstRing: 340.sp,
          second: 280.sp,
          thirdRing: 200.sp,
          imageHeight: 162.sp,
          imageWidth: 128.sp
      );
    }
  }

}

class ResponsiveData {
  double firstRing;
  double second;
  double thirdRing;
  double imageWidth;
  double imageHeight;
  ResponsiveData({
    required this.firstRing,
    required this.second,
    required this.thirdRing,
    required this.imageHeight,
    required this.imageWidth,
  });

}