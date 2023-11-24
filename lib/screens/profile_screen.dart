import 'package:assignment_project/core/components/components.dart';
import 'package:assignment_project/core/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedProfileMenuIndex = 0;
  final List<String> profileMenuSettings = ["Profile saya", "Pengaturan"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIcolors.appWhiteBackground,
      appBar: buildAppBar(),
      body: ListView(
        children: [
          20.verticalSpace,
          buildSelectProfileMenu(),
          30.verticalSpace,
          buildProfileForm(),
          20.verticalSpace,
          buildFooterBanner(),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: BackButton(),
      actions: [
        SvgPicture.asset("assets/svg/shopping-cart.svg"),
        10.horizontalSpace,
        SvgPicture.asset("assets/svg/notification-icon-menu.svg"),
        20.horizontalSpace,
      ],
    );
  }

  Widget buildProfileForm() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: UIcolors.appWhite,
        boxShadow: [
          BoxShadow(
            offset: const Offset(-1, 5),
            blurRadius: 5,
            spreadRadius: 0.1,
            color: UIcolors.appSoftGray.withOpacity(0.3),
          )
        ],
      ),
      child: Column(
        children: [
          buildCardProfile(),
        10.verticalSpace,
          buildHeaderText("Pilih data yang ingin ditampilkan"),
          10.verticalSpace,
          buildPersonalData(),
          20.verticalSpace,
          buildTextFields(),
           10.verticalSpace,
          buildSecurityInformation(),
         10.verticalSpace,
          buildSaveButton(),
        ],
      ),
    );
  }

  Widget buildSelectProfileMenu() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 49.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: UIcolors.appWhite,
        boxShadow: [
          BoxShadow(
            offset: const Offset(-1, 5),
            blurRadius: 5,
            spreadRadius: 0.1,
            color: UIcolors.appSoftGray.withOpacity(0.3),
          )
        ],
      ),
      child: Row(
        children: List.generate(
          profileMenuSettings.length,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                selectedProfileMenuIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: selectedProfileMenuIndex == index
                    ? UIcolors.appBlue
                    : UIcolors.appWhite,
              ),
              margin: const EdgeInsets.all(3),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(profileMenuSettings[index]).toMedium(
                fontWeight: selectedProfileMenuIndex == index
                    ? FontWeight.w600
                    : FontWeight.w400,
                color: selectedProfileMenuIndex == index
                    ? UIcolors.appPrimary
                    : null,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCardProfile() {
    return Container(
      height: 150.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: UIcolors.appPrimary,
      ),
      child: Column(
        children: [
          30.verticalSpace,
          Padding(
            padding: EdgeInsets.only(left: 40.w),
            child: Row(
              children: [
                Image.asset(
                  "assets/png/profile_picture.png",
                  width: 50.w,
                  height: 50.w,
                ),
                20.horizontalSpace,
                Column(
                  children: [
                    buildRichTextName(),
                    const Text("Membership BBLK").toRegular(
                        fontSize: 11, color: UIcolors.appSoftPrimary),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          buildInfoContainer(),
        ],
      ),
    );
  }

  Widget buildRichTextName() {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(children: [
        TextSpan(
          text: "Angga ",
          style: TextStyle(
            color: UIcolors.appWhite,
            fontFamily: 'Gilroy-bold',
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
        ),
        TextSpan(
          text: "Praja",
          style: TextStyle(
            color: UIcolors.appWhite,
            fontFamily: 'Gilroy-medium',
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
      ]),
    );
  }

  Widget buildInfoContainer() {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 5),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
        color: UIcolors.appSoft2Primary,
      ),
      child: Text(
        "Lengkapi profile anda untuk memaksimalkan penggunaan aplikasi",
      ).toRegular(fontSize: 12, color: UIcolors.appWhite),
    );
  }

  Widget buildHeaderText(String text) {
    return const Text(
      "Pilih data yang ingin ditampilkan",
    ).toMedium(
      color: UIcolors.appPrimary,
      fontWeight: FontWeight.w600,
    );
  }

  Widget buildPersonalData() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/svg/contact_icon.svg"),
        25.horizontalSpace,
        buildPersonalDataText(),
        25.horizontalSpace,
        buildLocationIcon(),
      ],
    );
  }

  Widget buildPersonalDataText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Data Diri").toMedium(fontSize: 14),
        Text("Data diri anda sesuai KTP").toRegular(fontSize: 10),
      ],
    );
  }

  Widget buildLocationIcon() {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Color(0xffEBEDF7),
      ),
      child: Icon(Icons.location_pin, color: UIcolors.appSoftGray),
    );
  }

  Widget buildInformationText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/svg/bi_info-circle-fill.svg"),
        10.horizontalSpace,
        Text(
          "Pastikan profile anda terisi dengan benar,\ndata pribadi anda terjamin keamanannya",
        ).toRegular(fontSize: 12),
      ],
    );
  }

  Widget buildTextFields() {
    return Column(
      children: [
        buildTextField("Nama Depan", "Masukkan nama depan"),
      10.verticalSpace,
        buildTextField("Nama Belakang", "Masukkan nama belakang"),
       10.verticalSpace,
        buildTextField("Email", "Masukkan email anda"),
       10.verticalSpace,
        buildTextField("No Telpon", "Masukkan no telpon anda"),
        10.verticalSpace,
        buildTextField("No. KTP", "Masukkan No. KTP anda"),
      ],
    );
  }

  Widget buildTextField(String labelText, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: MtextField(
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }

  Widget buildSecurityInformation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/svg/bi_info-circle-fill.svg"),
        10.horizontalSpace,
        Text(
          "Pastikan profile anda terisi dengan benar,\ndata pribadi anda terjamin keamanannya",
        ).toRegular(fontSize: 12),
      ],
    );
  }

  Widget buildSaveButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: MelevatedButton(
        trailingChild: SvgPicture.asset("assets/svg/bx_bx-save.svg"),
        text: "Simpan Profile",
        onPressed: () {},
      ),
    );
  }

  Widget buildFooterBanner() {
    return Container(
      height: 100,
      color: UIcolors.appPrimary,
      child: Image.asset(
        "assets/png/banner_footer.png",
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
