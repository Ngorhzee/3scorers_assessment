import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livesscore/core/constants/app_colors.dart';

class DasboardContainerWidget extends StatelessWidget {
  const DasboardContainerWidget(
      {super.key, this.miniChild, required this.child});
  final Widget? miniChild;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Pallet.offWhite,
        boxShadow: [
          BoxShadow(
              offset: const Offset(2, 8),
              color: Pallet.shadowColor.withOpacity(.6),
              blurRadius: 20.r,
              spreadRadius: 0)
        ],
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        10.r,
                      ),
                      topRight: Radius.circular(
                        10.r,
                      )),
                  color: Pallet.primaryColor),
              child: miniChild),
          child
        ],
      ),
    );
  }
}
