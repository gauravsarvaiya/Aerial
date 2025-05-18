import 'package:flutter/material.dart';

import '../../utils/utils.dart';


customBottomSheet(BuildContext context, {required WidgetBuilder builder}){
  final size = MediaQuery.of(context).size;

  showModalBottomSheet(context: context, backgroundColor: Colors.transparent, shape: const RoundedRectangleBorder(),
      isScrollControlled: true, builder: (context) {
        return  Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.all(15.sp),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.close_rounded, color: kRedColor, size: 25.sp),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: Colors.blueGrey.shade100,
                      constraints: BoxConstraints(minHeight: 10,maxHeight: (size.height * 0.75) - MediaQuery.of(context).viewInsets.bottom),
                      child: SingleChildScrollView(
                          padding: EdgeInsets.all(15.sp),
                          child: builder(context)),
                    ),
                  ),
                ),

              ],
            ),
          ),
        );
      }
  );
}