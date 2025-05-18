part of utils;

extension CustomTextStyle on TextStyle{

  static TextStyle get regularFont16Style=> TextStyle(
      color: kTextFiledTextColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400
  );

  static TextStyle get headerFont16Style=> TextStyle(
      color: kBlackColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600
  );


  static TextStyle get mediumFont18Style=> TextStyle(
      color: kLightGrayColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.w500
  );

  static TextStyle get textFieldRegularFont16Style => TextStyle(
      color: kWhiteColor,
      fontSize: kIsWeb ? 16 : 15.sp,
      fontWeight: FontWeight.w400
  );

  static TextStyle get boldFont22Style=> TextStyle(
      color: kWhiteColor,
      fontSize: 22.sp,
      fontWeight: FontWeight.w700
  );

  static TextStyle get boldFont18Style=> TextStyle(
      color: kBlackColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.w700
  );

  static TextStyle get regularFont14Style=> TextStyle(
      color: Colors.white,
      fontSize: 10.sp,
      fontWeight: FontWeight.w400
  );

  static TextStyle get regularBlueFont14Style=> TextStyle(
      color: kPrimaryColor,
      fontSize: 10.sp,
      fontWeight: FontWeight.w400
  );


  static TextStyle get boldFont24Style=> TextStyle(
      color: kWhiteColor,
      fontSize: 24.sp,
      fontWeight: FontWeight.w700
  );

  static TextStyle get boldFont26Style=> TextStyle(
      color: kWhiteColor,
      fontSize: 26.sp,
      fontWeight: FontWeight.w700
  );
}