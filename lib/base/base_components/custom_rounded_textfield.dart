import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/utils.dart';

class CustomRoundedTextField extends StatelessWidget {
  const CustomRoundedTextField({Key? key, this.scrollController,
    this.maxLine, this.startext ,this.headerText ,this.hint, this.label, this.isOptional, this.focusNode, this.controller, this.onChanged, this.inputType, this.inputFormatters, this.isEnable, this.errorText, this.textInputAction, this.onEditingComplete, this.regex, this.validationMessage, required this.name, this.instructions, this.emptyMessage, this.isSecure, this.suffix, this.prefix, this.maxLength, this.readOnly, this.onTap, this.suffixIcon, this.validatorExtra, this.autofillHints}) : super(key: key);

  final String? hint;
  final String? headerText;
  final String? startext;
  final String? label;
  final bool? isOptional;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isEnable;
  final ScrollController? scrollController;
  final String? errorText;
  final TextInputAction? textInputAction;
  final Function()? onEditingComplete;
  final String? regex;
  final String? validationMessage;
  final String name;
  final Iterable<String>? autofillHints;
  final String? instructions;
  final String? emptyMessage;
  final bool? isSecure;
  final Widget? suffix;
  final Widget? prefix;
  final int? maxLength;
  final int? maxLine;
  final bool? readOnly;
  final GestureTapCallback? onTap;
  final Widget? suffixIcon;
  final String? Function(String? value)? validatorExtra;

  String? validator(String? text) {
    if ((isOptional ?? true) && (text == null || text.isTrimEmpty)) return null;

    if (text == null) return emptyMessage ?? "Please enter $name.";

    if (text.isTrimEmpty) return emptyMessage ?? "Please enter $name.";

    if (regex != null) {
      final isMatch = RegExp(regex!).hasMatch(text);

      if (!isMatch) {
        return validationMessage ?? "Please enter Valid $name.";
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final viewInsets = EdgeInsets.fromViewPadding(View.of(context).viewInsets, View.of(context).devicePixelRatio);
    final keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerText == null ? SizedBox.shrink() : Row(
          children: [
            Text(headerText ?? "",style: CustomTextStyle.headerFont16Style),
            Text(startext ?? "",style: CustomTextStyle.headerFont16Style),
          ],
        ),

        headerText == null ? SizedBox.shrink() : SizedBox(height: 10.sp),

        Opacity(
          opacity: isEnable == false ? 0.8 : 1.0,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.sp)
            ),
            child: TextFormField(
              // scrollPadding: EdgeInsets.only(
              //     bottom:  keyboardVisible ? viewInsets.bottom + 30.sp : 120.sp ),
              onTap: onTap,
              cursorColor: kPrimaryColor,
              readOnly: readOnly ?? false,
              maxLength: maxLength,
              obscureText: isSecure ?? false,
              onEditingComplete: onEditingComplete,
              textInputAction: textInputAction,
              enabled: isEnable,
              keyboardType: inputType,
              inputFormatters: inputFormatters,
              controller: controller,
              focusNode: focusNode,
              onChanged: onChanged,
              autofillHints: autofillHints,
              style: CustomTextStyle.textFieldRegularFont16Style,
              validator: (value) {
                if(validatorExtra != null) {
                  final val = validatorExtra!(value);

                  if(val != null) {
                    return val;
                  }
                }

                return validator(value);
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              maxLines: maxLine,
              decoration: InputDecoration(
                counter: maxLength != null ? const SizedBox.shrink() : null,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: suffixIcon,
                suffix: suffix,
                labelText: label,
                hintText: hint,
                hintStyle: CustomTextStyle.regularFont16Style.copyWith(
                    color: Colors.white38,fontSize: kIsWeb ? 16.sp : 15.sp
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 10.sp),
                errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: kTextFiledBorderColor), borderRadius: BorderRadius.circular(8.sp)),
                focusedErrorBorder:  OutlineInputBorder(borderSide: const BorderSide(color: kTextFiledBorderColor), borderRadius: BorderRadius.circular(8.sp)),
                disabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: kTextFiledBorderColor), borderRadius: BorderRadius.circular(8.sp)),
                border: OutlineInputBorder(borderSide: const BorderSide(color: kTextFiledBorderColor), borderRadius: BorderRadius.circular(8.sp)),
                enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: kTextFiledBorderColor), borderRadius: BorderRadius.circular(8.sp)),
                focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: kTextFiledBorderColor), borderRadius: BorderRadius.circular(8.sp)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}



