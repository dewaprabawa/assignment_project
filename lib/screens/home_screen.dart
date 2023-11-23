import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:assignment_project/core/components/m_elevated_button.dart';
import 'package:assignment_project/core/styles/ui_colors.dart';
import 'package:assignment_project/core/styles/ui_font_text.dart';
import 'package:assignment_project/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: UIcolors.appWhiteBackground,
      appBar: buildAppBar(),
      endDrawer: buildEndDrawer(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          _scaffoldKey.currentState?.openEndDrawer();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            "assets/svg/dash_icons_menu.svg",
          ),
        ),
      ),
      actions: [
        SvgPicture.asset(
          "assets/svg/shopping-cart.svg",
        ),
        10.horizontalSpace,
        SvgPicture.asset(
          "assets/svg/notification-icon-menu.svg",
        ),
        20.horizontalSpace,
      ],
    );
  }

  Widget buildEndDrawer() {
    return DrawerTheme(
      data: const DrawerThemeData(),
      child: Row(
        children: [
          buildDrawerHeader(),
          Expanded(
            child: buildDrawerContent(),
          ),
        ],
      ),
    );
  }

  Widget buildDrawerHeader() {
    return Container(
      alignment: Alignment.topCenter,
      width: 70.w,
      height: double.infinity,
      color: UIcolors.appPrimary.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset("assets/svg/eva_close-circle-fill.svg"),
        ),
      ),
    );
  }

  Widget buildDrawerContent() {
    return Container(
      color: UIcolors.appWhite,
      child: ListView(
        children: <Widget>[
          100.verticalSpace,
          buildProfileInfo(),
          buildDrawerItem("Profile Saya", ProfileScreen()),
          buildDrawerItem("Pengaturan", null),
          30.verticalSpace,
          buildLogoutButton(),
          40.verticalSpace,
          buildSocialMediaSection(),
        ],
      ),
    );
  }

  Widget buildProfileInfo() {
    return Padding(
      padding: EdgeInsets.only(left: 40.w),
      child: Row(
        children: [
          Image.asset("assets/png/profile_picture.png", width: 70.w, height: 70.w),
          20.horizontalSpace,
          Column(
            children: [
              RichText(
                textAlign: TextAlign.start,
                text: TextSpan(children: [
                  TextSpan(
                    text: "Angga ",
                    style: TextStyle(
                      color: UIcolors.appPrimary,
                      fontFamily: 'Gilroy-bold',
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
                  TextSpan(
                    text: "Praja",
                    style: TextStyle(
                      color: UIcolors.appPrimary,
                      fontFamily: 'Gilroy-medium',
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                ]),
              ),
              const Text("Membership BBLK").toRegular(fontSize: 11, color: UIcolors.appSoftPrimary),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDrawerItem(String title, Widget? screen) {
    return GestureDetector(
      onTap: () {
        if (screen != null) {
          final route = CupertinoPageRoute(builder: (context) => screen);
          Navigator.pushReplacement(context, route);
        }
      },
      child: Padding(
        padding: EdgeInsets.only(left: 40.w, top: 30),
        child: Row(
          children: [
            Text(
              title,
            ).toMedium(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: UIcolors.appSoftGray,
              ),
            80.horizontalSpace,
            Icon(Icons.chevron_right, color: UIcolors.appSoftGray),
          ],
        ),
      ),
    );
  }

  Widget buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 100),
      child: MelevatedButton(
        radius: 20,
        height: 40.w,
        width: 10,
        backgroundColor: Colors.red,
        text: "Logout",
        onPressed: () {},
      ),
    );
  }

  Widget buildSocialMediaSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Ikuti kami di").toMedium(color: UIcolors.appPrimary),
        20.horizontalSpace,
        SvgPicture.asset("assets/svg/social_media_icons.svg"),
      ],
    );
  }

  Widget buildBody() {
    return ListView(
      shrinkWrap: true,
      children: [
        TopHomeSection(),
        BottomHomeSection(),
      ],
    );
  }
}

class TopHomeSection extends StatelessWidget {
  const TopHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20),
      children: [
        _buildMainBanner(),
        10.verticalSpace,
        _buildSecondaryBanner(),
        10.verticalSpace,
        _buildTertiaryBanner(),
        15.verticalSpace,
        _buildSearchSection(),
      ],
    );
  }

  SizedBox _buildMainBanner() {
    return SizedBox(
      height: 180.w,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(15),
            height: 150.w,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    UIcolors.appWhite,
                    UIcolors.appWhite,
                    Color(0xffDAE9F9)
                  ], // Adjust the colors as needed
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                color: UIcolors.appWhite,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(-3, 10),
                      blurRadius: 24,
                      spreadRadius: 0.2,
                      color: UIcolors.appSoftPrimary.withOpacity(0.4))
                ]),
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Solusi, ",
                                  style: TextStyle(
                                      color: UIcolors.appPrimary,
                                      fontFamily: 'Gilroy-medium',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp)),
                              TextSpan(
                                  text: "Kesehatan Anda",
                                  style: TextStyle(
                                      color: UIcolors.appPrimary,
                                      fontFamily: 'Gilroy-bold',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16.sp)),
                            ])),
                        5.verticalSpace,
                        const Text(
                                "Update informasi seputar kesehatan bisa disini !")
                            .toMedium(
                                fontSize: 14,
                                color: UIcolors.appSoftPrimary,
                                fontWeight: FontWeight.w400),
                        10.verticalSpace,
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: UIcolors.appPrimary),
                          child: Text("Selengkapnya").toMedium(
                              fontWeight: FontWeight.w500,
                              color: UIcolors.appWhite),
                        )
                      ],
                    )),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: List.generate(
                              3,
                              (index) => Container(
                                    height: 10,
                                    width: index == 0 ? 50 : 10,
                                    margin: EdgeInsets.only(
                                        right: index == 3 ? 0 : 10, bottom: 20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: UIcolors.appWhite),
                                  )),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: SvgPicture.asset(
                  "assets/svg/calender-icon.svg",
                ),
              )),
        ],
      ),
    );
  }

  SizedBox _buildSecondaryBanner() {
    return SizedBox(
      height: 180.w,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            padding: EdgeInsets.all(15),
            height: 150.w,
            decoration: BoxDecoration(
                color: UIcolors.appWhite,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(-3, 10),
                      blurRadius: 24,
                      spreadRadius: 0.2,
                      color: UIcolors.appSoftGray.withOpacity(0.4))
                ]),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Layanan khusus",
                      style: TextStyle(
                          color: UIcolors.appPrimary,
                          fontFamily: 'Gilroy-medium',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp),
                    ),
                    5.verticalSpace,
                    const Text("Tes Covid 19, Cegah Corona\nSedini mungkin")
                        .toMedium(
                            fontSize: 14,
                            color: UIcolors.appSoftPrimary,
                            fontWeight: FontWeight.w400),
                    10.verticalSpace,
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Text("Daftar Tes").toMedium(
                                fontWeight: FontWeight.w600,
                                color: UIcolors.appPrimary),
                            10.horizontalSpace,
                            Icon(
                              Icons.arrow_forward_outlined,
                              color: UIcolors.appPrimary,
                            )
                          ],
                        ))
                  ],
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: SvgPicture.asset(
                  "assets/svg/vaksin_icon.svg",
                ),
              )),
        ],
      ),
    );
  }

  SizedBox _buildTertiaryBanner() {
    return SizedBox(
      height: 180.w,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            padding: EdgeInsets.all(15),
            height: 150.w,
            decoration: BoxDecoration(
                color: UIcolors.appWhite,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(-3, 10),
                      blurRadius: 24,
                      spreadRadius: 0.2,
                      color: UIcolors.appSoftGray.withOpacity(0.4))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Track Pemeriksaan",
                      style: TextStyle(
                          color: UIcolors.appPrimary,
                          fontFamily: 'Gilroy-medium',
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp),
                    ),
                    5.verticalSpace,
                    const Text(
                            "Kamu dapat mengecek\nprogress pemeriksaanmu disini")
                        .toMedium(
                            fontSize: 14,
                            color: UIcolors.appSoftPrimary,
                            fontWeight: FontWeight.w400),
                    10.verticalSpace,
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Text("Track").toMedium(
                                fontWeight: FontWeight.w600,
                                color: UIcolors.appPrimary),
                            10.horizontalSpace,
                            Icon(
                              Icons.arrow_forward_outlined,
                              color: UIcolors.appPrimary,
                            )
                          ],
                        ))
                  ],
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 35,
                  top: 25,
                ),
                child: SvgPicture.asset(
                  "assets/svg/search_icon.svg",
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildSearchSection() {
    return Row(
      children: [
        Container(
          height: 50.w,
          width: 50.w,
          padding: const EdgeInsets.all(10),
          child: SvgPicture.asset("assets/svg/adjustment_icon.svg"),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: UIcolors.appWhite,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(-3, 12),
                    blurRadius: 20,
                    spreadRadius: 0.2,
                    color: UIcolors.appSoftGray.withOpacity(0.4))
              ]),
        ),
        20.horizontalSpace,
        Expanded(
          flex: 3,
          child: Container(
            height: 50.w,
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                Text("Search").toRegular(color: UIcolors.appSoftGray),
                Spacer(),
                Icon(
                  Icons.search,
                  color: UIcolors.appPrimary,
                )
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: UIcolors.appWhite,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(-3, 12),
                      blurRadius: 20,
                      spreadRadius: 0.2,
                      color: UIcolors.appSoftGray.withOpacity(0.4))
                ]),
          ),
        )
      ],
    );
  }
}

class BottomHomeSection extends StatefulWidget {
  const BottomHomeSection({Key? key});

  @override
  State<BottomHomeSection> createState() => _BottomHomeSectionState();
}

class _BottomHomeSectionState extends State<BottomHomeSection> {
  int selectedProductIndex = 0;
  int selectedServiceIndex = 0;

  final List<String> tabTitles = ["All Product", "Layanan Kesehatan", "Alat Kesehatan"];

  final List<HealthServiceModel> healthServiceModels = [
    HealthServiceModel(
      serviceName: "PCR Swab Test (Drive Thru)Hasil 1 Hari Kerja",
      servicePrice: "Rp. 1.400.000",
      serviceHospitalName: "Lenmarc Surabaya",
      serviceLocation: "Dukuh Pakis, Surabaya",
      imageUrl: "assets/png/hospital-01.png",
    ),
    HealthServiceModel(
      serviceName: "PCR Swab Test (Drive Thru)Hasil 1 Hari Kerja",
      servicePrice: "Rp. 1.400.000",
      serviceHospitalName: "Lenmarc Surabaya",
      serviceLocation: "Dukuh Pakis, Surabaya",
      imageUrl: "assets/png/hospital-02.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        buildTabTitles(),
        buildProductList(),
        buildServiceTypeSelection(),
        buildHealthServiceList(),
        buildFooterBanner(),
      ],
    );
  }

  Widget buildTabTitles() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          tabTitles.length,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                selectedProductIndex = index;
              });
            },
            child: buildTabTitle(index),
          ),
        ),
      ),
    );
  }

  Widget buildTabTitle(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.only(
        top: 10.w,
        bottom: 10.w,
        right: selectedProductIndex == index ? 20.w : 10.w,
        left: selectedProductIndex == index ? 20.w : 10.w,
      ),
      margin: EdgeInsets.only(top: 10.w, bottom: 10.w, right: 15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: index == selectedProductIndex ? UIcolors.appPrimary : UIcolors.appWhite,
        boxShadow: [
          BoxShadow(
            offset: const Offset(-1, 10),
            blurRadius: 5,
            spreadRadius: 0.1,
            color: UIcolors.appSoftGray.withOpacity(0.3),
          )
        ],
      ),
      child: Center(
        child: Text(tabTitles[index]).toMedium(
          color: index == selectedProductIndex ? UIcolors.appWhite : UIcolors.appPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget buildProductList() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          4,
          (index) => buildProductItem(),
        ),
      ),
    );
  }

  Widget buildProductItem() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10.w, bottom: 10.w, right: 15.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(-2, 5),
            blurRadius: 5,
            spreadRadius: 0.1,
            color: UIcolors.appSoftGray.withOpacity(0.3),
          )
        ],
        borderRadius: BorderRadius.circular(15),
        color: UIcolors.appWhite,
      ),
      child: buildProductItemContent(),
    );
  }

  Widget buildProductItemContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        buildStarRating(),
        buildProductImage(),
        10.verticalSpace,
        buildProductInfo(),
      ],
    );
  }

  Widget buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SvgPicture.asset("assets/svg/ant-design_star-filled.svg"),
       2.verticalSpace,
        const Text("5").toMedium(
          color: UIcolors.appSoftGray,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }

  Widget buildProductImage() {
    return Padding(
      padding: const EdgeInsets.only(right: 20 + 5 + 20),
      child: Image.asset(
        "assets/png/product-01.png",
        height: 100.w,
        width: 100.w,
      ),
    );
  }

  Widget buildProductInfo() {
    return Row(
      children: [
        buildProductTextInfo(),
        15.verticalSpace,
        buildProductStatus(),
      ],
    );
  }

  Widget buildProductTextInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Suntik Steril").toMedium(
          fontWeight: FontWeight.w600,
        ),
         5.verticalSpace,
        const Text("Rp. 10.000").toMedium(
          color: UIcolors.appOrange,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ],
    );
  }

  Widget buildProductStatus() {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: UIcolors.appSoftGreen,
      ),
      child: const Text("Ready Stok").toRegular(
        color: UIcolors.appDarkGreen,
        fontSize: 12,
      ),
    );
  }

  Widget buildServiceTypeSelection() {
    return Column(
      children: [
        15.verticalSpace,
        buildServiceTypeContainer(),
      ],
    );
  }

  Widget buildServiceTypeContainer() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20, right: 100.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(-2, 5),
            blurRadius: 5,
            spreadRadius: 0.1,
            color: UIcolors.appSoftGray.withOpacity(0.3),
          )
        ],
        color: UIcolors.appWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: buildServiceTypeRow(),
    );
  }

  Widget buildServiceTypeRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        buildServiceTypeItem("Satuan"),
        buildServiceTypeItem("Paket Pemeriksaan"),
      ],
    );
  }

  Widget buildServiceTypeItem(String text) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      margin: EdgeInsets.only(right: 10, bottom: 3, top: 3, left: 3).r,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(-2, 5),
            blurRadius: 5,
            spreadRadius: 0.1,
            color: UIcolors.appSoftGray.withOpacity(0.3),
          )
        ],
        color: UIcolors.appBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text).toMedium(
        color: UIcolors.appPrimary,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget buildHealthServiceList() {
    return ListView.builder(
      physics: const ClampingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: healthServiceModels.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return buildHealthServiceItem(index);
      },
    );
  }

  Widget buildHealthServiceItem(int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: UIcolors.appWhite,
        boxShadow: [
          BoxShadow(
            offset: const Offset(-2, 5),
            blurRadius: 5,
            spreadRadius: 0.1,
            color: UIcolors.appSoftGray.withOpacity(0.3),
          )
        ],
      ),
      child: Row(
        children: [
          10.horizontalSpace,
          buildHealthServiceInfo(index),
          buildHealthServiceImage(index),
        ],
      ),
    );
  }

  Widget buildHealthServiceInfo(int index) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(healthServiceModels[index].serviceName).toMedium(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          Text(healthServiceModels[index].servicePrice).toMedium(
            color: UIcolors.appOrange,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          buildHospitalInfo(index),
        ],
      ),
    );
  }

  Widget buildHospitalInfo(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          SvgPicture.asset("assets/svg/fa-solid_hospital.svg"),
          5.horizontalSpace,
        Text(healthServiceModels[index].serviceHospitalName).toMedium(
          color: UIcolors.appGray,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        ],),
         Row(children: [
        SvgPicture.asset("assets/svg/fluent_location-28-filled.svg"),
        5.horizontalSpace,
        Text(healthServiceModels[index].serviceLocation).toMedium(
          color: UIcolors.appSoftGray,
          fontSize: 14,
        ),
         ],)
      ],
    );
  }

  Widget buildHealthServiceImage(int index) {
    return Expanded(
      flex: 1,
      child: Image.asset(healthServiceModels[index].imageUrl),
    );
  }

  Widget buildFooterBanner() {
    return Container(
      height: 100,
      color: UIcolors.appPrimary,
      child: Image.asset("assets/png/banner_footer.png", fit: BoxFit.fitWidth),
    );
  }
}


class HealthServiceModel {
  final String serviceName;
  final String servicePrice;
  final String serviceHospitalName;
  final String serviceLocation;
  final String imageUrl;

  HealthServiceModel(
      {required this.serviceName,
      required this.servicePrice,
      required this.serviceHospitalName,
      required this.serviceLocation,
      required this.imageUrl
      });
}
