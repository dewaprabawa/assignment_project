import 'package:assignment_project/core/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FooterTitleText extends StatelessWidget {
  final String text1;
  final String text2;
  final Widget leadingSubIcon;
  final String subText;
  const FooterTitleText({
    super.key, required this.text1, required this.text2, required this.leadingSubIcon, required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        15.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(text1).toMedium(
            color: UIcolors.appSoftGray
          ), 10.horizontalSpace,
           Text(text2).toMedium(
            color: UIcolors.appPrimary,fontWeight: FontWeight.w700
          ), 10.horizontalSpace,
          
        ],),
        15.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          leadingSubIcon,
           10.horizontalSpace
          ,  Text(subText).toMedium(
            color: UIcolors.appSoftGray
          ),
        ],)
      ],
    );
  }
}

