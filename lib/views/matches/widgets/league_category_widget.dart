import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livesscore/core/constants/app_colors.dart';
import 'package:livesscore/models/league_model.dart';
import 'package:livesscore/widgets/app_text.dart';
import 'package:livesscore/widgets/image_loader.dart';

class LeagueCategoryWidget extends StatelessWidget {
  const LeagueCategoryWidget({
    super.key,
    required this.isActive,
    required this.league,
  });
  final bool isActive;
  final LeagueModel league;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40.w,
          width: 40.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? Pallet.primaryColor : Pallet.blackColor.shade100),
          child: Center(
            child: ImageLoader(
              height: 27.w,
              width: 27.w,
              path: league.icon,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        AppText.bodyMedium(league.name)
      ],
    );
  }
}
