import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livesscore/core/constants/app_assets.dart';
import 'package:livesscore/core/constants/app_colors.dart';
import 'package:livesscore/core/constants/text_styles.dart';
import 'package:livesscore/views/matches/matches_view.dart';
import 'package:livesscore/widgets/image_loader.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int currentIndex = 1;
  List<Widget> views = [
    Container(),
    MatchesView(),
    Container(),
    Container(),
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[currentIndex],
      bottomNavigationBar: Container(
        width: 1.sw,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Pallet.border,width: 0.55.w),
          ),
        ),
        child: BottomNavigationBar(
            selectedFontSize: 11.sp,
            // elevation: 0,
            showUnselectedLabels: true,
            backgroundColor: Pallet.white,
            unselectedFontSize: 11.sp,
            selectedLabelStyle: labelSmall,
            unselectedLabelStyle: labelSmall,
            selectedItemColor: Pallet.primaryColor,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Pallet.blackColor.shade200,
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: ImageLoader(
                  height: 28.w,
                  width: 28.w,
                  path: AppAssets.home,
                  dColor: currentIndex == 0
                      ? Pallet.primaryColor
                      : Pallet.blackColor.shade200,
                  fit: BoxFit.cover,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: ImageLoader(
                  height: 28.w,
                  width: 28.w,
                  path: AppAssets.matches,
                  dColor: currentIndex == 1
                      ? Pallet.primaryColor
                      : Pallet.blackColor.shade200,
                  fit: BoxFit.cover,
                ),
                label: "Matches",
              ),
              BottomNavigationBarItem(
                icon: ImageLoader(
                  height: 28.w,
                  width: 28.w,
                  path: AppAssets.fantasy,
                  dColor: currentIndex == 2
                      ? Pallet.primaryColor
                      : Pallet.blackColor.shade200,
                  fit: BoxFit.cover,
                ),
                label: "Fantasy",
              ),
              BottomNavigationBarItem(
                icon: ImageLoader(
                  height: 28.w,
                  width: 28.w,
                  path: AppAssets.profile,
                  isCircular: true,
                  radius: 14.w,
                ),
                label: "Profile",
              )
            ]),
      ),
    );
  }
}
