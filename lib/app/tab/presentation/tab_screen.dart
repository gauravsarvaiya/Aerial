import '../../../base/base_components/custom_bottom_sheet.dart';
import '../../../base/base_components/custom_dialog_widget.dart';
import '../../../utils/utils.dart';
import '../../lending/application/lending_provider.dart';
import '../../profile/route/profile_route.dart';
import '../model/tab_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../home/route/home_route.dart';
import '../application/tab_provider.dart';
import '../../lending/route/lending_route.dart';
import '../../../utils/sizer/get_size_widget.dart';


class TabScreen extends StatefulWidget {
  final Widget? child;
  final String? path;
  BuildContext? context;

  TabScreen({super.key, this.child, this.context, this.path});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  void initState() {
    super.initState();
    print("token : ${SecureStorage.token}");
    WidgetsBinding.instance.addPostFrameCallback((_) async {
        if(kIsWeb) {
          _handleRoute(context);
        }
      },
    );
  }


  void _handleRoute(BuildContext context) {
    final tabProvider = context.read<TabProvider>();
    final route = GoRouter.of(context).routerDelegate.currentConfiguration.uri.pathSegments[0];


    if (route == HomeRoute.homeName) {
      tabProvider.tabChangeIndex(index: 0);
    } else if (route == ProfileRoute.profileName) {
      tabProvider.tabChangeIndex(index: 1);
    } else {
      tabProvider.tabChangeIndex(index: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tabProvider = context.watch<TabProvider>();
    final currentIndex = tabProvider.currentIndex;
    final isProfile = tabProvider.isProfile;

    List<Icon> tabIcons = [
      Icon(Icons.home),
      Icon(Icons.account_circle),
    ];

    List<String> tabWebName = [
      "Home",
      "Profile"
    ];


    print("${widget.path} ==== check currentPath?");
    final lastValue = widget.path?.split("/").last;

    final path = (lastValue?.contains("?") == true) ? lastValue?.split("?").first : lastValue;

    final isWeb = GetSizedData.webSize(context);

    final hideBottom = path == HomeRoute.homeName || path == ProfileRoute.profileName;


    /// ================================================ WEB CODE

    if (isWeb) {
      return GestureDetector(
        onTap: () {
          final tabProvider = context.read<TabProvider>();
          tabProvider.webProfile(false);
        },
        child: Scaffold(
          backgroundColor: kSecondaryColor,
          body: Stack(
            children: [
              Container(
                height: 300.sp,
                color: kSecondaryColor,
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).padding.top + 15.sp),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 10),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Expanded(
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    tabProvider.tabChangeIndex(index: 0);
                                    HomeRoute.goToHomePage(context: context);
                                  },
                                  child: MouseRegion(
                                    opaque: false,
                                    cursor: SystemMouseCursors.click,
                                    child: Container(
                                        width: 80.sp,
                                        height: 95.sp,
                                        child: Image.asset("assets/images/logo.png")),
                                  ),
                                ),

                                SizedBox(
                                  width: isWeb ? 10.sp : 70.sp,
                                ),

                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: List.generate(
                                      tabWebName.length,
                                      (index) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {

                                              tabProvider.webProfile(false);
                                              tabProvider.tabChangeIndex(index: index);

                                              switch (index) {
                                                case 0:
                                                  HomeRoute.goToHomePage(context: context);
                                                  break;
                                                case 1:
                                                  ProfileRoute.goToProfilePage(context: context);
                                                  break;
                                              }
                                              FocusManager.instance.primaryFocus?.unfocus();
                                            });
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8.sp,
                                                horizontal: MediaQuery.of(context).size.width >= 875 ? 15.sp : 8.sp ),
                                            child: MouseRegion(
                                              cursor: SystemMouseCursors.click,
                                              opaque: false,
                                              child: Text(tabWebName[index],
                                                style: TextStyle(fontSize: 15.sp,
                                                  fontWeight: currentIndex == index
                                                          ? FontWeight.w500
                                                          : FontWeight.w300,
                                                  color: currentIndex == index
                                                      ? Colors.white
                                                      : Color(0xffC2C2C2),
                                                ),
                                              ),
                                            ),
                                          )
                                        );
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),

                    const Divider(
                      color: Color(0xffC2C2C2),
                    ),
                    // SizedBox(
                    //     height: MediaQuery.of(context).padding.bottom + 30.sp
                    // ),
                    Expanded(child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 10),
                      child: widget.child ?? Container(),
                    )),
                  ],
                ),
              ),

              if (isProfile)
                webProfileDesign(context,isWeb),

            ],
          ),
        ),
      );
    }

    /// ================================================ APP CODE

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Stack(fit: StackFit.expand, children: [
        widget.child ?? Container(),
      ]),
      bottomNavigationBar: (hideBottom)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  margin: EdgeInsets.only(top: 7.sp, bottom: 25.sp, right: 20.sp, left: 20.sp),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(tabIcons.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 0.sp),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            tabProvider.tabChangeIndex(index: index);

                            switch (index) {
                              case 0:
                                HomeRoute.goToHomePage(context: context);
                                break;
                              case 1:
                                ProfileRoute.goToProfilePage(context: context);
                                break;
                            }

                            FocusManager.instance.primaryFocus?.unfocus();
                          });
                        },
                        child: Padding(
                            padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
                            child: Container(
                                padding: EdgeInsets.all(10.sp),
                                // margin: EdgeInsets.symmetric(horizontal: 10.sp),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    color: index == currentIndex
                                        ? kPrimaryColor
                                        : null),
                                child: Icon(tabIcons[index].icon,color: index == currentIndex
                                    ? Colors.white
                                    : kLightGrayColor))
                        ),
                      ),
                    );
                  })
                    ]),
                  ),
              ],
            )
          : null,
    );

  }

  Widget plusBtn({GestureTapCallback? onTap}) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: SafeArea(
        child: Row(
          children: [
            InkWell(
              onTap: onTap,
              child: Container(
                height: 58.sp,
                width: 58.sp,
                padding: EdgeInsets.all(18.sp),
                decoration: BoxDecoration(
                    color: kRedColor,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: Offset(0, 5),
                          blurRadius: 15)
                    ],
                    shape: BoxShape.circle),
                child: Icon(Icons.ac_unit),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget webProfileDesign(BuildContext context,bool? isWeb) {

    return Positioned(
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 10),
        // padding: EdgeInsets.zero,
        child: Container(
          margin: EdgeInsets.only(top: 80.sp),
          width: 300.sp,
          // width: double.infinity,
          padding: EdgeInsets.all(12.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.sp),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    width: 35.sp,
                    height: 35.sp,
                    decoration: const BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.sp),
                      child: Container(),
                    ),
                  ),
                  SizedBox(width: 10.sp),
                  Expanded(
                    child: Text(
                      "Hello",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              ctmDivider(),

              Column(
                children: [
                  InkWell(
                    onTap: (){
                      logOutBottomSheet();
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Logout",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.chevron_right,
                                color: Colors.black54))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  logOutBottomSheet(){
    final lendingProvider = context.read<LendingProvider>();
    final tabProvider = context.read<TabProvider>();
    customBottomSheet(context,
      builder: (context) {
        return CustomDialogWidget(
          title: "Logout",
          message: "Are you sure you want to logout?",
          primaryBtnTxt: "Yes",
          secondaryBtnTxt: "Cancel",
          primaryLoader: false,
          primaryAction: (){
            lendingProvider.clearAppState();
            // RouteConfig.goFirstPopNamed(context: context, name: LendingRoute.lendingName);
            RouteConfig.goPushReplacementNamed(context: context, name: LendingRoute.lendingName);
            tabProvider.tabChangeIndex(index: 0);
          },
          secondaryAction: (){},
        );
      },);
  }

  Widget ctmDivider(){
    return Column(
      children: [
        SizedBox(height: 5.sp),
        Divider(height: 1.sp, color: Colors.grey.withOpacity(0.5)),
        SizedBox(height: 5.sp),
      ],
    );

  }

}
