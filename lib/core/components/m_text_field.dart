import 'package:assignment_project/core/styles/ui_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MtextField extends StatefulWidget {
  const MtextField({
    Key? key,
    this.controller,
    this.margin =  EdgeInsets.zero,
    this.onChanged,
    this.hintText,
    this.hintStyle,
    this.borderWidth = 0.0,
    this.errorText,
    this.errorStyle,
    this.labelText,
    this.labelStyle,
    this.trailingLabel,
    this.trailingLabelStyle,
    this.borderColor,
    this.borderRadius,
    this.textInputAction,
    this.textInputType,
    this.isShakeErrorAnimationActive = false,
    this.isSecurity = false,
    this.enabled = true,
    this.expands = false,
    this.trailingChild = const SizedBox.shrink(),
    this.leadingChild = const SizedBox.shrink(),
    this.color = UIcolors.appWhite,
  }) : super(key: key);
  final bool isShakeErrorAnimationActive;
  final bool isSecurity;
  final EdgeInsets margin; 
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final Color? borderColor;
  final double? borderRadius;
  final double borderWidth;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? errorText;
  final TextStyle? errorStyle;
  final String? trailingLabel;
  final TextStyle? trailingLabelStyle;
  final bool? enabled;
  final Widget trailingChild;
  final Widget leadingChild;
  final bool expands;
  final void Function(String)? onChanged;
  final Color color;

  @override
  State<MtextField> createState() => _MtextFieldState();
}

class _MtextFieldState extends State<MtextField>
    with SingleTickerProviderStateMixin {
  bool isFocused = false;
  bool isShowPassowrd = false;
 
  @override
  Widget build(BuildContext context) {
    
    //text_field
    Widget textField = TextFormField(
      expands: widget.expands,
      enabled: widget.enabled,
      controller: widget.controller ?? TextEditingController(),
      onChanged: widget.onChanged,
      style: const TextStyle(fontFamily: "Gilroy", fontWeight: FontWeight.w600),
      textInputAction: widget.textInputAction,
      keyboardType: widget.textInputType,
      obscureText: widget.isSecurity,
      decoration: InputDecoration(
          contentPadding:  EdgeInsets.symmetric(horizontal: 10.w),
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ??  TextStyle(fontFamily: "Gilroy-regular", fontWeight: FontWeight.w400, color: UIcolors.appGray, fontSize:  16.sp),
          labelStyle: widget.labelStyle,
          errorStyle: widget.labelStyle,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none),
    );

    //focus_node
    Widget focusNode = Focus(
      onFocusChange: _onFocusChanged,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: UIcolors.appSoftGray.withOpacity(0.16),
              blurRadius: 24.r,
              spreadRadius: 0,
              offset: const Offset(0, 16)
            )
          ],
            color: widget.color,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
                ),
        child: Row(children: [
        widget.leadingChild,  Expanded(child: textField), widget.trailingChild,
        ],),
      ),
    );

    //label_text
    Widget labelText = const SizedBox.shrink();
    Widget trailingLabelText = const SizedBox.shrink();
    if (widget.labelText != null) {
      if(widget.trailingLabel != null){
        trailingLabelText = Text(
              widget.trailingLabel ?? "",
              style:  TextStyle(fontFamily: "Gilroy-medium", fontWeight: FontWeight.w700, color: UIcolors.appSoftPrimary, fontSize:  16.sp),
            );
      }
      labelText = Padding(
        padding: const EdgeInsets.only(left: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.labelText ?? "",
              style: widget.labelStyle != null ? widget.labelStyle :  TextStyle(fontFamily: "Gilroy-medium", fontWeight: FontWeight.w700, color: UIcolors.appPrimary, fontSize:  16.sp),
            ),
            trailingLabelText
          ],
        ),
      );
    }

    //error_text
    Widget errorText = const SizedBox.shrink();
    if (widget.errorText != null) {
      errorText = Text(
        widget.errorText ?? "",
        overflow: TextOverflow.ellipsis,
        style: widget.errorStyle ??
          const TextStyle(fontFamily: "Gilroy", fontWeight: FontWeight.w700, color: UIcolors.appOrange),
      );
    }


    return Padding(
      padding: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText,
           SizedBox(
            height: 4.h,
          ),
          focusNode,
           SizedBox(
            height: 5.h,
          ),
          errorText,
        ],
      ),
    );
  }

  void _onFocusChanged(value) {
    if (value) {
      setState(() {
        isFocused = true;
      });
    } else {
      setState(() {
        isFocused = false;
      });
    }
  }
}