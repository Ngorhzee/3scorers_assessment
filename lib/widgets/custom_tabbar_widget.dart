import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livesscore/core/constants/app_colors.dart';
import 'package:livesscore/core/constants/text_styles.dart';

class CustomTabbarWidget extends StatelessWidget {
  const CustomTabbarWidget({
    super.key,
    required this.tabs,
  });

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12.h, left: 16.w, right: 16.w),
      color: Pallet.tabGreen.withOpacity(.9),
      child: TabBar(
        tabs: [
          ...List.generate(
            tabs.length,
            (index) => Text(
              tabs[index],
            ),
          )
        ],
        indicatorColor: Pallet.primaryColor,
        indicatorSize: TabBarIndicatorSize.tab,
        labelPadding: EdgeInsets.only(bottom: 8.h),
        labelStyle: labelLarge.copyWith(fontSize: 16.sp),
        unselectedLabelStyle: bodyLarge,
        indicatorWeight: 4.h,
        labelColor: Pallet.white,
        unselectedLabelColor: Pallet.greyColor,
      ),
    );
  }
}
