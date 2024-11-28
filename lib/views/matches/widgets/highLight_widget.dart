import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livesscore/bloc_providers/highlight/high_light_bloc.dart';
import 'package:livesscore/core/constants/app_assets.dart';
import 'package:livesscore/core/constants/app_colors.dart';
import 'package:livesscore/core/utils/utils.dart';
import 'package:livesscore/widgets/app_text.dart';
import 'package:livesscore/widgets/image_loader.dart';

class HighLightWidget extends StatefulWidget {
  const HighLightWidget({
    super.key,
    required this.homeTeamName,
    required this.homeTeamLogo,
    required this.awayTeamName,
    required this.awayTeamLogo,
  });
  final String homeTeamName;
  final String homeTeamLogo;
  final String awayTeamName;
  final String awayTeamLogo;
  @override
  State<HighLightWidget> createState() => _HighLightWidgetState();
}

class _HighLightWidgetState extends State<HighLightWidget> {
  @override
  void initState() {
    context.read<HighLightBloc>().add(GetHighlight());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HighLightBloc, HighLightState>(
      builder: (context, state) {
        if (state is HighlightData) {
          return Container(
            padding: EdgeInsets.all(16.w),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Pallet.blackColor.withOpacity(.65), BlendMode.darken),
                    image: CachedNetworkImageProvider(
                      state.highlightData.thumbnailUrl ?? "",
                    ),
                    fit: BoxFit.fitWidth),
                color: Pallet.blackColor.withOpacity(.65)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText.labelSmall(
                  "Watch Highlight",
                  color: Pallet.white,
                  fontSize: 12.sp,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        ImageLoader(
                          height: 80.w,
                          width: 80.w,
                          blob: convertToBlobImage(widget.homeTeamLogo),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        AppText.headlineLarge(
                          widget.homeTeamName,
                          fontSize: 12.sp,
                          color: Pallet.white,
                        )
                      ],
                    )),
                    Container(
                      height: 50.w,
                      width: 50.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Pallet.white.withOpacity(.7),
                      ),
                      child: Center(
                        child: ImageLoader(
                          height: 24.w,
                          width: 24.w,
                          path: AppAssets.play,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        ImageLoader(
                          height: 80.w,
                          width: 80.w,
                          blob: convertToBlobImage(widget.awayTeamLogo),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        AppText.headlineLarge(
                          widget.awayTeamName,
                          fontSize: 12.sp,
                          color: Pallet.white,
                        )
                      ],
                    )),
                  ],
                )
              ],
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
