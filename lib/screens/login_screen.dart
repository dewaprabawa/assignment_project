import 'package:assignment_project/core/components/components.dart';
import 'package:assignment_project/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:assignment_project/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../core/styles/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailText = TextEditingController();
  final TextEditingController passwordText = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailText.dispose();
    passwordText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.authProgressStatus == AuthProgressStatus.failure) {
          _toastSnackbar(context, state.message);
        }
        if (state.authProgressStatus == AuthProgressStatus.success) {
          emailText.clear();
          passwordText.clear();
          _toastSnackbar(context, "Anda berhasil login...");
        }
      },
      builder: (context, state) {
        bool isLoading = state.authProgressStatus == AuthProgressStatus.loading;
        return SafeArea(
            top: false,
            child: Scaffold(
              backgroundColor: UIcolors.appWhite,
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
                        children: [SvgPicture.asset("assets/svg/app_logo.svg")],
                      ),
                      MtextField(
                        enabled: !isLoading,
                        controller: emailText,
                        labelText: "Email",
                        hintText: "Masukkan email anda",
                      ),
                      20.verticalSpace,
                      MtextField(
                        enabled: !isLoading,
                        isSecurity: state.isSecure,
                        controller: passwordText,
                        trailingLabel: "Lupa Password anda ?",
                        labelText: "Password",
                        hintText: "Masukkan password anda",
                        trailingChild: GestureDetector(
                            onTap: () {
                              context.read<AuthCubit>().isSecurityPassword();
                            },
                            child: SvgPicture.asset(
                              "assets/svg/secure-off.svg",
                              color: state.isSecure ? UIcolors.appOrange : null,
                            )),
                      ),
                      20.verticalSpace,
                      MelevatedButton(
                        backgroundColor: isLoading ? UIcolors.appGray : null,
                        trailingChild: isLoading
                            ? const CircularProgressIndicator()
                            : const Icon(
                                Icons.arrow_forward,
                                color: UIcolors.appWhite,
                              ),
                        onPressed: () {
                          _onPressedLogin(state);
                        },
                        text: isLoading ? "loading..." : 'Login',
                      ),
                      FooterTitleText(
                        onPressed: () {
                          final route = CupertinoPageRoute(
                              builder: (context) => const RegisterScreen());
                          Navigator.push(context, route);
                        },
                        text1: 'Belum punya akun ?',
                        text2: "Daftar Sekarang",
                        leadingSubIcon:
                            SvgPicture.asset("assets/svg/c-circle-outline.svg"),
                        subText: "SILK. all right reserved",
                      )
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }

  void _onPressedLogin(AuthState state) async {
    if (state.authProgressStatus == AuthProgressStatus.loading) return;
    if (emailText.text.isEmpty) {
      _toastSnackbar(context, "Email anda tidak boleh kosong !");
      return;
    }
    if (passwordText.text.isEmpty) {
      _toastSnackbar(context, "Password anda tidak boleh kosong !");
      return;
    }
    await context
        .read<AuthCubit>()
        .login(email: emailText.text, password: passwordText.text);
  }

  void _toastSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: UIcolors.appWhite, content: Text(message).toMedium()));
  }
}
