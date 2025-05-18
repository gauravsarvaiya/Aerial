import 'package:aerial/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../base/base_components/custom_bottom_sheet.dart';
import '../../../base/base_components/custom_dialog_widget.dart';
import '../../../utils/sizer/get_size_widget.dart';
import '../../lending/application/lending_provider.dart';
import '../../lending/route/lending_route.dart';
import '../../tab/application/tab_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  bool isOn = false;
  bool isNotification = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final isWeb = GetSizedData.webSize(context);

    return Scaffold(
      appBar: isWeb ?  null : AppBar(
        leading: SizedBox.shrink(),
        title: const Text("Profile"),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: 12.sp,
              ),
        
              Text("Hello Aerial", style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22.sp,
                color: kPrimaryColor
              ),),
        
              SizedBox(
                height: 20.sp,
              ),
        
              ListView.builder(itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: (){
                        if(index == 1){
                          logOutBottomSheet(context);
                        }
                      },
                      child: Container(
                         padding:  EdgeInsets.symmetric(vertical: 5.sp),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(proList[index], style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.sp,
                                color: kWhiteColor
                              ),),
                            ),

                            Icon(Icons.chevron_right_rounded, color: kWhiteColor.withOpacity(0.8)),

                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: kTextFiledBorderColor.withOpacity(0.1),
                    )
                  ],
                );
              }, itemCount: proList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              )
        
            ],
          ),
        ),
      ),
    );
  }

  List<String> proList = ["About as" , "Logout"];

  logOutBottomSheet(BuildContext context){
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
        primaryAction: ()async{
          try {
            lendingProvider.clearAppState();
            // RouteConfig.goFirstPopNamed(context: context, name: LendingRoute.lendingName);
            RouteConfig.goPushReplacementNamed(context: context, name: LendingRoute.lendingName);
            tabProvider.tabChangeIndex(index: 0);
          } catch (e) {
            print(e);
          }
        },
        secondaryAction: (){},
      );
    },);
  }


}
