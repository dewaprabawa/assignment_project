
import 'package:assignment_project/core/styles/ui_colors.dart';
import 'package:assignment_project/core/styles/ui_font_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MelevatedButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final void Function() onPressed;
  final Color? backgroundColor;
  final Widget? trailingChild;
  final double? radius;
  const MelevatedButton({super.key, required this.text,  this.height, this.trailingChild, required this.onPressed, this.backgroundColor, this.radius, this.width});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: UIcolors.appGray,
        elevation: 1,
        fixedSize: Size(width ?? double.infinity, height ?? 48.h),
        minimumSize: Size(width ?? double.infinity, height ?? 48.h),
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius ?? 8.0), // Adjust the value as needed
    ),
        backgroundColor: backgroundColor ?? UIcolors.appPrimary
      ),
      onPressed: (){
        onPressed();
    }, child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      15.horizontalSpace,   
       Text(text).toMedium(
      color: UIcolors.appWhite
    ),
    trailingChild ?? const SizedBox.shrink()
    ],));
  }
}