import 'package:assignment_project/core/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/components/components.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
         top: false,
        child: Scaffold(
      backgroundColor: UIcolors.appWhite,
      appBar: AppBar(
        title: Text("Login").toMedium(),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
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
                children: [SvgPicture.asset("assets/svg/app_logo.svg")],
              ),
              Row(
                children: [
                  const Expanded(
                    child: MtextField(
                      labelText: "Nama Depan",
                      hintText: "Masukkan nama depan",
                    ),
                  ),
                  20.horizontalSpace,
                  const Expanded(
                    child: MtextField(
                      labelText: "Nama Belakang",
                      hintText: "Masukkan nama belakang",
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              const MtextField(
                labelText: "No. KTP",
                hintText: "Masukkan No. KTP anda",
              ),
              20.verticalSpace,
              const MtextField(
                labelText: "Email",
                hintText: "Masukkan email anda",
              ),
              20.verticalSpace,
              MtextField(
                labelText: "Password",
                hintText: "Masukkan password anda",
                trailingChild: SvgPicture.asset("assets/svg/secure-off.svg"),
              ),
              20.verticalSpace,
              MtextField(
                labelText: "Konfirmasi Password",
                hintText: "Konfirmasi password anda",
                trailingChild: SvgPicture.asset("assets/svg/secure-off.svg"),
              ),
              20.verticalSpace,
              MelevatedButton(
                trailingChild: const Icon(
                  Icons.arrow_forward,
                  color: UIcolors.appWhite,
                ),
                onPressed: () {},
                text: 'Register',
              ),
              FooterTitleText(
                onPressed: (){
                  Navigator.pop(context);
                },
                text1: 'Sudah punya akun ?',
                text2: "Login Sekarang",
                leadingSubIcon:
                    SvgPicture.asset("assets/svg/c-circle-outline.svg"),
                subText: "SILK. all right reserved",
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    ));
  }
}
