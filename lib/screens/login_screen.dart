import 'package:assignment_project/core/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../core/styles/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
      backgroundColor:  UIcolors.appWhite,
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const HeaderTitleText(
              text1: "Hai, ",
              text2: "Selamat Datang",
              subText: "Silahkan login untuk melanjutkan",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              SvgPicture.asset("assets/svg/app_logo.svg")
            ],),
            const MtextField(
              labelText: "Email",
              hintText: "Masukkan email anda",
            ),
           20.verticalSpace,
            MtextField(
              trailingLabel: "Lupa Password anda ?",
              labelText: "Password",
              hintText: "Masukkan password anda",
              trailingChild: SvgPicture.asset("assets/svg/secure-off.svg"),
            ),
            20.verticalSpace,
             MelevatedButton(
               trailingChild:  const Icon(Icons.arrow_forward, color: UIcolors.appWhite,),
               onPressed: () {  }, text: 'Login',),
            FooterTitleText(text1: 'Belum punya akun ?', text2: "Daftar Sekarang", leadingSubIcon: SvgPicture.asset("assets/svg/c-circle-outline.svg"), subText: "SILK. all right reserved",)
          ],),
        ),
      ),
    ));
  }
}

