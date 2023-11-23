
import 'package:assignment_project/core/styles/styles.dart';
import 'package:flutter/material.dart';

class HeaderTitleText extends StatelessWidget {
  final String text1;
  final String text2;
  final String subText;
  const HeaderTitleText({
    super.key, required this.text1, required this.text2, required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
        children: [
          TextSpan(text:text1, style: const TextStyle(color: UIcolors.appPrimary, fontFamily: 'Gilroy-medium', fontWeight: FontWeight.w500,fontSize: 28)),
          TextSpan(
              text: text2,
              style: const TextStyle(color: UIcolors.appPrimary, fontFamily: 'Gilroy-bold', fontWeight: FontWeight.w900,fontSize: 28)),
        ]
            )),
            Text(subText, style: const TextStyle(
        color: UIcolors.appSoftPrimary,
        fontFamily: 'Gilroy-semibold',
        fontWeight: FontWeight.w500
            ),),
      ],
    );
  }
}