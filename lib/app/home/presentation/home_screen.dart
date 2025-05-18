import 'package:aerial/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../../utils/sizer/get_size_widget.dart';

class HomeScreen extends StatefulWidget {
  final BuildContext? context;
  const HomeScreen({super.key, this.context});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    print("home page is TEST ==========");

    final isWeb = GetSizedData.webSize(context);


    return Scaffold(
      backgroundColor: kIsWeb ? Colors.transparent : null,
      appBar: !kIsWeb  ? AppBar(
        leading: const SizedBox.shrink(),
        title:  Text("HomeScreen"),
      ) : null,

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.sp),
        child: SafeArea(
          top: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Welcome , ", style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24.sp,
                          color: kPrimaryColor
                      ),),
                      Text("Hello Aerial Team", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 20.sp,
                      ),),
                      SizedBox(width: 10.sp,),
                    ],
                  ),
                ],
              ),

              SizedBox(
                height: 10.sp,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("About Aerial", style: TextStyle(
                   fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    color: kWhiteColor
                  )),

                  SizedBox(
                    height: 10.sp,
                  ),

                  Text("""The dawn of 60’s, witnessed a new beginning. The technical capabilities of the company were enhanced and with it, Harish started manufacturing textile machines, which were only available at Indian companies having foreign collaboration.
                  \nWith an aim to explore new possibilities, in 1970, Harish was converted into a private limited company with members of the Gandhi family as its Promoters and Directors. With avision to set a new benchmark, Harish added different products for the textile industry.
                  \nSince 1964, Harish was engaged in the production of Hot Air Stenters. With in-depth insights, it exported the very first Hot Air Stenter in the year 1974, and even today, this machine processes 40,000 meters of fabric per day. Encouraged by the belief, “If you do something great, don’t dwell on it Move ahead to do something else, that’s greater; ask yourself, “What’s next?”” Harish thus, started exporting its machines to countries around the world.
                  \nWith Head quarters in Mumbai, has its machinery manufacturing units at Umbergaon, Bhilad, and Ahmedabad. These plants empowered by solid machineries and latest automation systems, multiply the speed of developing quality products. The in-house R&D experienced personnel enable Harish to launch new and innovative products into the textile machinery frequently.
                  """,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: kWhiteColor
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget webSpareComponent() {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffDFDFDF),
          // image: DecorationImage(image: AssetImage("assets/images/image/background_image.png")),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.black12)
      ),
      child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          children: [
            Container(
              height: 45.sp,
              width: 45.sp,
              // margin: EdgeInsets.only(bottom: 25.sp),
            ),

            Text("Explore Spares",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600),),

            // Container(
            //     decoration: const BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: Colors.white
            //     ),
            //     padding: EdgeInsets.all(12.sp),
            //     child: Images.commonIcons.link(context)
            // ),

            Container(
              height: 25.sp,
              width: 25.sp,
              // margin: EdgeInsets.only(bottom: 25.sp),
            ),

          ],
        ),
      ),
    );
  }

}



