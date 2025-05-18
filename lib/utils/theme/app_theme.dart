part of utils;

ThemeData appTheme(BuildContext context){
  return ThemeData(
      appBarTheme: AppBarTheme.of(context).copyWith(
          centerTitle: true,
          color: Colors.transparent,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          foregroundColor: kBlackColor,
          surfaceTintColor: Colors.transparent,
          toolbarHeight: kToolbarHeight,
          titleTextStyle: TextStyle(
            color: kWhiteColor,
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            // fontFamily: "Outfit"
          ),
          shape:  UnderlineInputBorder(
            borderSide: BorderSide(color: kTextSecondaryColor.withOpacity(0.30)),
          )
      ),
      scaffoldBackgroundColor: kSecondaryColor,
      primarySwatch: primarySwatchColor,
      useMaterial3: true,
      fontFamily: "Outfit"
  );
}
