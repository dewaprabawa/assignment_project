import 'package:assignment_project/core/styles/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const fontFamily = "Gilroy";

extension TextModifier on Text {
  Text toThin({double? fontSize = 16, Color? color}) {
    return Text(
      data ?? '',
      style: TextStyle(
          fontFamily: "Gilroy-thin",
          fontSize: fontSize?.sp,
          fontWeight: FontWeight.w200,
          color: color ?? UIcolors.appBlack),
    );
  }

  Text toRegular({double? fontSize = 16, Color? color}) {
    return Text(
      data ?? '',
      style: TextStyle(
          fontFamily: "Gilroy-regular",
          fontSize: fontSize?.sp,
          fontWeight: FontWeight.w400,
          color: color ?? UIcolors.appBlack),
    );
  }

  Text toMedium({double? fontSize = 16, Color? color, FontWeight? fontWeight}) {
    return Text(
      data ?? '',
      style: TextStyle(
          fontFamily: "Gilroy-medium",
          fontSize: fontSize?.sp,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: color ?? UIcolors.appBlack),
    );
  }

  Text toSemiBold({double? fontSize = 16, Color? color}) {
    return Text(
      data ?? '',
      style: TextStyle(
          fontFamily: "Gilroy-semibold",
          fontSize: fontSize?.sp,
          fontWeight: FontWeight.w600,
          color: color ?? UIcolors.appBlack),
    );
  }

  Text toBold({double? fontSize = 16, Color? color}) {
    return Text(
      data ?? '',
      style: TextStyle(
          fontFamily: "Gilroy-bold",
          fontSize: fontSize?.sp,
          fontWeight: FontWeight.w700,
          color: color ?? UIcolors.appBlack),
    );
  }
}
