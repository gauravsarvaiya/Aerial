import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import 'loading_view.dart';

class CustomDialogWidget extends StatelessWidget {
  final String title;
  final String? errorText;
  final String message;
  final String primaryBtnTxt;
  final String? secondaryBtnTxt;
  final Function? primaryAction;
  final bool primaryLoader;
  final Function? secondaryAction;
  const CustomDialogWidget({super.key, required this.title, required this.message, required this.primaryBtnTxt, this.secondaryBtnTxt, this.primaryAction, required this.primaryLoader, this.secondaryAction, this.errorText});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon(Icons.close,color: Colors.transparent,),
                Expanded(
                  child: Text(title,style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    color: kBlackColor
                  ),textAlign: TextAlign.center,),
                ),
                // IconButton(icon: Icon(Icons.close), onPressed: (){
                //   Navigator.of(context).pop();
                // })
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Container(
              constraints: BoxConstraints(minWidth: 100, maxWidth: size.width > 500 ? 500 : size.width * 0.9,minHeight: 10,maxHeight: size.height * 0.5),
              child: SingleChildScrollView(
                child: Text(message,
                  softWrap: true,
                  style:  TextStyle(
                      fontSize: 16,
                    color: kTextSecondaryColor
                  ),textAlign: TextAlign.center,),
              ),
            ),
          ),
          if(errorText != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Container(
              constraints: BoxConstraints(minWidth: 100, maxWidth: size.width > 500 ? 500 : size.width * 0.9,minHeight: 10,maxHeight: size.height * 0.5),
              child: SingleChildScrollView(
                child: Text(errorText ?? "",
                  softWrap: true,
                  style: const TextStyle(
                      fontSize: 16,
                    color: Colors.red
                  ),textAlign: TextAlign.center,),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Row(
              children: [
                if(secondaryBtnTxt != null)
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: TextButton(
                        onPressed: !primaryLoader ? (){
                          Navigator.of(context).pop();
                          if(secondaryAction != null ){
                            secondaryAction!();
                          }
                        } : null,
                        child: Text(secondaryBtnTxt ?? "",style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),),
                      ),
                    ),
                  ),
                if(secondaryBtnTxt != null)
                  const SizedBox(width: 10,),

                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.red.shade500,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: TextButton(
                      onPressed: (){
                        // Navigator.of(context).pop();
                        if(primaryAction != null){
                          primaryAction!();
                        }
                      },
                      child: primaryLoader ?
                       Center(
                         child: Loading(color: kPrimaryColor,),
                       )   :
                      Text(primaryBtnTxt,style:  TextStyle(
                          color: kWhiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      )),
                      // child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Text(primaryBtnTxt,style: const TextStyle(
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 16
                      //     )),
                      //
                      //     SizedBox(width: 10.sp),
                      //
                      //     if(primaryLoader)
                      //       SizedBox(
                      //         height: 25.sp,width: 25.sp,
                      //         child: CircularProgressIndicator(
                      //           color: kWhiteColor,
                      //           strokeWidth: 1,
                      //         ),
                      //       )
                      //
                      //   ],
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
