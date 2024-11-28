import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livesscore/core/constants/app_assets.dart';
import 'package:livesscore/core/constants/app_colors.dart';

class PitchBackgroundWidget extends StatelessWidget {
  const PitchBackgroundWidget({
    super.key,
    required this.child,
    required this.image,
  });

  final Widget child;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        // color: Pallet.tabGreen.withOpacity(.9),
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
              Pallet.tabGreen.withOpacity(.5), BlendMode.darken),
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}
