part of "../utils.dart";

extension SizerExt on num {

  double get h => SizerUtil.height == 0.0 ? this * 812 / 100 : this * SizerUtil.height / 100;

  double get w => SizerUtil.width == 0.0 ? this * 375 / 100: this * SizerUtil.width / 100;

  double get sp {

    var width = SizerUtil.width;

    if (width == 0.0) {
      return this * 1.0;
    }

    if(SizerUtil.width > SizerUtil.maxWidth) {
      width = 450;
    } else if(SizerUtil.width < 300) {
      width = 300;
    }

    return (width * this)/428;

  }

}