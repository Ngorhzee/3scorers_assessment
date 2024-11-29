import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livesscore/core/constants/app_colors.dart';
import 'package:livesscore/core/constants/data.dart';
import 'package:livesscore/core/utils/utils.dart';
import 'package:livesscore/widgets/app_text.dart';
import 'package:livesscore/widgets/image_loader.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({
    super.key,
    required this.playerName,
    this.reason,

    required this.isHome,
  });
  final String playerName;

  final String? reason;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      reason != null
          ? Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
                  isHome ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                AppText.bodyMedium(
                  playerName,
                  color: Pallet.blackColor,
                ),
                SizedBox(
                  height: 4.h,
                ),
                AppText.bodySmall(
                  reason ?? "",
                  color: Pallet.greyColor.shade100,
                )
              ],
            )
          : AppText.bodyMedium(
              playerName,
              color: Pallet.blackColor,
            ),
      SizedBox(
        width: 4.w,
      ),
        ImageLoader(
                    height: 30.w,
                    width: 30.w,
                    isCircular: true,
                    radius: 32.5.w,
                    fit: BoxFit.contain,
                    blob: convertToBlobImage(playerImage),
                  ),
    ];
    return Row(
      children: isHome ? children.reversed.toList() : children,
    );
  }
}