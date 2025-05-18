import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:aerial/utils/utils.dart';
import 'package:provider/provider.dart';
import '../../../../../../base/base_components/toaster_msg.dart';
import '../../../../../../repository/lending/model/app_state.dart';
import '../../../../../lending/application/lending_provider.dart';
import '../../../../../lending/route/lending_route.dart';
import '../../../../../tab/application/tab_provider.dart';
import '../../../../application/auth_provider.dart';
import '../../../../../../utils/sizer/get_size_widget.dart';
import '../../../../../../base/base_components/custom_button.dart';
import '../../../../../../base/base_components/custom_rounded_textfield.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  bool isPasswordSecure = true;
  final formKey = GlobalKey<FormState>();
  final forgotPasswordKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController forgotPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      // passwordFocus.addListener(() {
      //   if(passwordFocus.hasFocus){
      //     passwordController.selection = TextSelection(
      //       baseOffset: 0,
      //       extentOffset: passwordController.text.length,
      //     );
      //   }
      //
      //   setState(() {});
      // },);
      // emailController.text = "soham@yopmail.com";
      // passwordController.text = "123456";
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.watch<AuthProvider>();
    final loginLoader = loginProvider.loginResponse.state == Status.loading;
    final isWeb = GetSizedData.webSize(context);
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
           width: isWeb ? 165.sp : 115.sp,
            height : isWeb ? 150.sp : 106.sp,
            child: Image.asset("assets/images/logo.png",fit: BoxFit.fill,),
          ),

          SizedBox(height: isWeb ? 80.sp : 20.sp),

          Text("Welcome, Login below", style: TextStyle(
            fontWeight: FontWeight.w400,
            color: kWhiteColor,
            fontSize: isWeb ? 16.sp : 15.sp,
          ), textAlign: TextAlign.center),

          SizedBox(
            height: isWeb ? 24.sp : 22.sp,
          ),

          Column(
            children: [
              CustomRoundedTextField(
                maxLength: 50,
                controller: emailController,
                hint: "Email address",
                isOptional: false,
                isEnable: true,
                inputType: TextInputType.text,
                name: "email address",
                textInputAction: TextInputAction.next,
                regex: StringValidation.emailValidation,
              ),

              SizedBox(
                height: isWeb ? 20.sp : 16.sp,
              ),

              CustomRoundedTextField(
                // headerText: "Password",
                maxLength: 50,
                controller: passwordController,
                hint: "Password",
                isOptional: false,
                isEnable: true,
                isSecure: isPasswordSecure,
                maxLine: 1,
                regex: StringValidation.passwordValidation,
                inputType: TextInputType.text,
                name: "password",
                suffixIcon: InkWell(
                    canRequestFocus: false,
                    onTap: () {
                      setState(() {
                        isPasswordSecure = !isPasswordSecure;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.sp),
                      child: !isPasswordSecure ? Icon(Icons.remove_red_eye_outlined) : Icon(Icons.visibility_off_outlined) ,
                    )),
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: 8.sp,
              ),
            ],
          ),

          SizedBox(
            height: isWeb ? 24.sp : 20.sp,
          ),

          CustomButton(
            onTap: ()async{
              await onSubmit(context,
                  emailId: emailController.text,
                  password: passwordController.text,
              );
            },
            isLoading: loginLoader,
            btnText: "Login",
          ),

          SizedBox(
            height: isWeb ? 15.sp : 10.sp,
          ),

          Container(constraints: BoxConstraints(
                maxWidth: SizerUtil.maxWidth
            ),
            child: Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Text("Forgot Password ?", style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color:kWhiteColor ,
                      fontSize: kIsWeb ? 14 : 13.sp
                  ),),
                ),
              ),
            ),
          ),
          
          SizedBox(height: isWeb ? 80.sp : MediaQuery.of(context).size.height / 3.8.sp),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don’t have an account ",style:  CustomTextStyle.regularFont16Style.copyWith(
                  color: Colors.white38,fontSize: kIsWeb ? 16.sp :14.sp
              ),),
              Text(" Create Account",
                style: CustomTextStyle.regularFont16Style.copyWith(
                    color: kWhiteColor,fontSize: kIsWeb ? 16.sp :14.sp
                ),)
            ],
          ),
        ],
      ),
    );
  }

  Future onSubmit(BuildContext context, {String? password, String? emailId}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    final loginProvider = context.read<AuthProvider>();
    final lendingProvider = context.read<LendingProvider>();
    final tabProvider = context.read<TabProvider>();

    try {
      await loginProvider.logIn(emailId: emailId, password: password);

      final res = loginProvider.loginResponse.data;
      if (res == null || res.accessToken == null) {
        throw Exception("Login failed: Invalid credentials or null response.");
      }

      final appState = AppState(
        isLogin: true,
        token: res.accessToken,
      );

      await lendingProvider.setAppState(state: appState);
      RouteConfig.goPushReplacementNamed(context: context, name: LendingRoute.lendingName);

      Toaster.showMessage(context, msg: res.message ?? "Login successful", isError: false);
      tabProvider.tabChangeIndex(index: 0);

    } catch (e) {
      Toaster.showMessage(context, msg: e.toString(), isError: true);
    }
  }


// Future onSubmit(BuildContext context,{String? password,String? emailId}) async{
  //
  //   FocusManager.instance.primaryFocus?.unfocus();
  //
  //   final isValid = formKey.currentState?.validate() ?? false;
  //
  //   if(isValid == false) return;
  //
  //   final loginProvider = context.read<AuthProvider>();
  //   final lendingProvider = context.read<LendingProvider>();
  //   final tabProvider = context.read<TabProvider>();
  //
  //   try {
  //     await loginProvider.logIn(
  //       emailId: emailId,
  //       password: password,
  //     );
  //
  //     final res = loginProvider.loginResponse.data;
  //
  //     final appState = AppState(
  //       isLogin: true,
  //       // userID: res?.userid.toString() ?? "",
  //       token: res?.accessToken,
  //       // memberID: res?.associationid.toString() ?? "",
  //     );
  //
  //     await lendingProvider.setAppState(state: appState);
  //
  //     RouteConfig.goPushReplacementNamed(context: context, name: LendingRoute.lendingName);
  //
  //     Toaster.showMessage(context, msg: loginProvider.loginResponse.data?.message ?? "",isError: false);
  //
  //     tabProvider.tabChangeIndex(index: 0);
  //
  //   } catch (e) {
  //     Toaster.showMessage(context, msg: e.toString(),isError: true);
  //   }
  //
  // }
}
