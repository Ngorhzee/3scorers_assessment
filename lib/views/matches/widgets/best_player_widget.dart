import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livesscore/bloc_providers/best_player/best_player_bloc.dart';
import 'package:livesscore/core/constants/app_colors.dart';
import 'package:livesscore/core/constants/data.dart';
import 'package:livesscore/core/utils/utils.dart';
import 'package:livesscore/models/best_player_model.dart';
import 'package:livesscore/widgets/app_text.dart';
import 'package:livesscore/widgets/dashboard_container_widget.dart';
import 'package:livesscore/widgets/image_loader.dart';

class BestPlayerWidget extends StatefulWidget {
  const BestPlayerWidget(
      {super.key,
      required this.homeTeamBlob,
      required this.awayTeamBlob,
      required this.homeTeamName,
      required this.awayTeamName});
  final String homeTeamBlob;
  final String awayTeamBlob;
  final String homeTeamName;
  final String awayTeamName;
  @override
  State<BestPlayerWidget> createState() => _BestPlayerWidgetState();
}

class _BestPlayerWidgetState extends State<BestPlayerWidget> {
  @override
  void initState() {
    context.read<BestPlayerBloc>().add(LoadBestPlayer());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestPlayerBloc, BestPlayerState>(
      builder: (context, state) {
        if (state is BestPlayerData) {
          BestTeamPlayer? bestPlayer =
              double.parse(state.data.bestHomeTeamPlayer?.value ?? "0") >
                      double.parse(state.data.bestAwayTeamPlayer?.value ?? "0")
                  ? state.data.bestHomeTeamPlayer
                  : state.data.bestAwayTeamPlayer;
          bool isHome =
              double.parse(state.data.bestHomeTeamPlayer?.value ?? "0") >
                  double.parse(state.data.bestAwayTeamPlayer?.value ?? "0");
          return DasboardContainerWidget(
            miniChild: Row(
              children: [
                AppText.headlineMedium(
                  "Best Player",
                  color: Pallet.white,
                  fontSize: 14.sp,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  ImageLoader(
                    height: 65.w,
                    width: 65.w,
                    isCircular: true,
                    radius: 32.5.w,
                    fit: BoxFit.contain,
                    blob: convertToBlobImage(playerImage),
                  ),
                  SizedBox(
                    width: 6.5.w,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.bodyLarge(
                        bestPlayer?.player?.shortName ?? "",
                        color: Pallet.blackColor,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          ImageLoader(
                            height: 20.w,
                            width: 20.w,
                            fit: BoxFit.cover,
                            blob: convertToBlobImage(isHome
                                ? widget.homeTeamBlob
                                : widget.awayTeamBlob),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          AppText.labelMedium(isHome
                              ? widget.homeTeamName
                              : widget.awayTeamName)
                        ],
                      )
                    ],
                  )),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Pallet.primaryColor),
                    child: AppText.headlineMedium(
                      bestPlayer?.value ?? "",
                      color: Pallet.white,
                      fontSize: 11.sp,
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
