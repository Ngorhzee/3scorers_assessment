import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livesscore/core/constants/app_colors.dart';
import 'package:livesscore/core/utils/utils.dart';
import 'package:livesscore/widgets/app_text.dart';
import 'package:livesscore/widgets/image_loader.dart';

class ClubIntroWidget extends StatelessWidget {
  const ClubIntroWidget({
    super.key,
    required this.title, required this.blob,
  });
  final String title;
  final String blob;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageLoader(
          height: 20.w,
          width: 20.w,
          blob: convertToBlobImage(blob),
          fit: BoxFit.contain,
        ),
        SizedBox(
          height: 4.h,
        ),
        AppText.bodyMedium(
          title,
          color: Pallet.blackColor,
        )
      ],
    );
  }
}
