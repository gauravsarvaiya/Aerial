part of utils;

extension StringValidation on String{
  static String get emailValidation =>
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static String get mobileValidation =>
      r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$';

  static String get passwordValidation => r'.{6,10}';
 bool get isTrimEmpty => trim().isEmpty;
}
