import 'package:flutter/material.dart';

import '../../../../../../utils/utils.dart';

class ResponsiveRadiatingDevice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final containerWidth = constraints.maxWidth;
        final ring1Size = containerWidth * 0.6;
        final ring2Size = containerWidth * 0.5;
        final ring3Size = containerWidth * 0.4;
        final imageSize = containerWidth * 0.3;

        return Container(
          width: containerWidth/2,
          height: constraints.maxHeight,
          color: kPrimaryColor,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Outer Ring
                Container(
                  width: ring1Size,
                  height: ring1Size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const RadialGradient(
                      colors: [Colors.white10, kPrimaryColor],
                      tileMode: TileMode.decal,
                    ),
                    border: Border.all(
                      color: const Color(0xffFFE4AF),
                      width: 2,
                    ),
                  ),
                ),

                // Middle Ring
                Container(
                  width: ring2Size,
                  height: ring2Size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const RadialGradient(
                      colors: [Colors.white10, kPrimaryColor],
                      tileMode: TileMode.decal,
                    ),
                    border: Border.all(
                      color: const Color(0xffFFE4AF),
                      width: 2,
                    ),
                  ),
                ),

                // Inner Ring
                Container(
                  width: ring3Size,
                  height: ring3Size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const RadialGradient(
                      colors: [Colors.white10, kPrimaryColor],
                      tileMode: TileMode.decal,
                    ),
                    border: Border.all(
                      color: const Color(0xffFFE4AF),
                      width: 2,
                    ),
                  ),
                ),

                // Device Image
                SizedBox(
                  width: imageSize,
                  height: imageSize,
                  child: Image.asset(
                    "assets/images/device_img.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
