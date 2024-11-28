import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:livesscore/bloc_providers/highlight/high_light_bloc.dart';
import 'package:livesscore/bloc_providers/match_details/match_details_bloc.dart';
import 'package:livesscore/core/constants/app_assets.dart';
import 'package:livesscore/core/constants/app_colors.dart';
import 'package:livesscore/core/constants/text_styles.dart';
import 'package:livesscore/core/utils/utils.dart';
import 'package:livesscore/views/matches/widgets/best_player_widget.dart';
import 'package:livesscore/views/matches/widgets/chart_widget.dart';
import 'package:livesscore/views/matches/widgets/highLight_widget.dart';
import 'package:livesscore/views/matches/widgets/match_stats_widget.dart';
import 'package:livesscore/views/matches/widgets/pitch_background_widget.dart';
import 'package:livesscore/widgets/app_text.dart';
import 'package:livesscore/widgets/custom_tabbar_widget.dart';
import 'package:livesscore/widgets/dashboard_container_widget.dart';
import 'package:livesscore/widgets/image_loader.dart';

class MatchDetailsView extends StatefulWidget {
  const MatchDetailsView({super.key});

  @override
  State<MatchDetailsView> createState() => _MatchDetailsViewState();
}

class _MatchDetailsViewState extends State<MatchDetailsView> {
  List<String> tabs = ["Overview", "Line-up", "Statistics", "Matches"];
  @override
  void initState() {
    context.read<MatchDetailsBloc>().add(LoadMatchDetail());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: BlocBuilder<MatchDetailsBloc, MatchDetailsState>(
          builder: (context, state) {
            if (state is MatchDetailsData) {
              return Column(
                children: [
                  PitchBackgroundWidget(
                      image: AppAssets.pitch2,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 12.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ImageLoader(
                                      height: 24.w,
                                      width: 24.w,
                                      path: AppAssets.arrowRight,
                                    ),
                                    Expanded(
                                        child: Center(
                                            child: AppText.headlineMedium(
                                                "Match Details"))),
                                    ImageLoader(
                                      height: 24.w,
                                      width: 24.w,
                                      path: AppAssets.notification,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 24.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                ImageLoader(
                                                  height: 50.w,
                                                  width: 50.w,
                                                  fit: BoxFit.cover,
                                                  blob: state.data.homeTeam!
                                                              .logo !=
                                                          null
                                                      ? convertToBlobImage(state
                                                          .data.homeTeam!.logo!)
                                                      : null,
                                                ),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                AppText.labelLarge(
                                                  state.data.homeTeam?.name ??
                                                      "",
                                                  color: Pallet.white,
                                                  fontSize: 16.sp,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            ...List.generate(
                                                1,
                                                (index) => Row(
                                                      children: [
                                                        AppText.bodyMedium(
                                                          "K. De Bruyne",
                                                          color: Pallet.white,
                                                        ),
                                                        SizedBox(
                                                          width: 8.w,
                                                        ),
                                                        AppText.labelMedium(
                                                          "76'",
                                                          color: Pallet.white,
                                                        )
                                                      ],
                                                    ))
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: state.data.homeScore
                                                        ?.normaltime
                                                        .toString(),
                                                    style: headingLarge.copyWith(
                                                        fontSize: 32.sp,
                                                        color: state
                                                                    .data
                                                                    .homeScore!
                                                                    .current! >
                                                                (state
                                                                    .data
                                                                    .awayScore!
                                                                    .current!)
                                                            ? Pallet.white
                                                            : Pallet
                                                                .greyColor)),
                                                TextSpan(
                                                    text: " - ",
                                                    style: headingLarge),
                                                TextSpan(
                                                    text: state.data.awayScore
                                                        ?.normaltime
                                                        .toString(),
                                                    style: headingLarge.copyWith(
                                                        fontSize: 32.sp,
                                                        color: state
                                                                    .data
                                                                    .awayScore!
                                                                    .current! >
                                                                (state
                                                                    .data
                                                                    .homeScore!
                                                                    .current!)
                                                            ? Pallet.white
                                                            : Pallet
                                                                .greyColor)),
                                              ],
                                            ),
                                          ),
                                          AppText.labelMedium(
                                              "(${state.data.homeScore?.penalties} -${state.data.awayScore?.penalties})"),
                                          AppText.labelMedium("Penalty"),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                          ImageLoader(
                                            height: 13.44.w,
                                            width: 13.44.w,
                                            fit: BoxFit.cover,
                                            path: AppAssets.ball,
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Column(
                                              children: [
                                                ImageLoader(
                                                  height: 50.w,
                                                  width: 50.w,
                                                  fit: BoxFit.cover,
                                                  blob: state.data.awayTeam!
                                                              .logo !=
                                                          null
                                                      ? convertToBlobImage(state
                                                          .data.awayTeam!.logo!)
                                                      : null,
                                                ),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                AppText.labelLarge(
                                                  state.data.awayTeam?.name ??
                                                      "",
                                                  color: Pallet.white,
                                                  fontSize: 16.sp,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            ...List.generate(
                                                1,
                                                (index) => Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        AppText.bodyMedium(
                                                          "Rodrygo",
                                                          color: Pallet.white,
                                                        ),
                                                        SizedBox(
                                                          width: 8.w,
                                                        ),
                                                        AppText.labelMedium(
                                                          "12'",
                                                          color: Pallet.white,
                                                        )
                                                      ],
                                                    ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          CustomTabbarWidget(tabs: tabs)
                        ],
                      )),
                  SizedBox(
                    height: 16.h,
                  ),
                  Expanded(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: HighLightWidget(
                            homeTeamLogo: state.data.homeTeam?.logo ?? "",
                            awayTeamLogo: state.data.awayTeam?.logo ?? "",
                            homeTeamName: state.data.homeTeam?.name ?? "",
                            awayTeamName: state.data.awayTeam?.name ?? "",
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 16.h,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: BestPlayerWidget(
                            homeTeamBlob: state.data.homeTeam?.logo ?? "",
                            awayTeamBlob: state.data.awayTeam?.logo ?? "",
                            homeTeamName: state.data.homeTeam?.name ?? "",
                            awayTeamName: state.data.awayTeam?.name ?? "",
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 16.h,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: ChartWidget(
                            homeTeamBlob: state.data.homeTeam?.logo ?? "",
                            awayTeamBlob: state.data.awayTeam?.logo ?? "",
                            homeColor: hexToColor(
                                state.data.homeTeam?.teamColors?.primary ?? ""),
                            awayColor: hexToColor(
                                state.data.awayTeam?.teamColors?.secondary ??
                                    ""),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 16.h,
                          ),
                        ),
                        SliverToBoxAdapter(
                            child: MatchStatsWidget(
                                homeTeamBlob: state.data.homeTeam?.logo ?? "",
                                awayTeamBlob: state.data.awayTeam?.logo ?? "")),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 16.h,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: DasboardContainerWidget(
                            miniChild: Row(
                              children: [
                                AppText.headlineMedium(
                                  "Game Information",
                                  color: Pallet.white,
                                  fontSize: 14.sp,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 12,
                                  ),
                                  GameInfoWidget(
                                    title: "Venue",
                                    info: state.data.venue?.stadium?.name ?? "",
                                    icon: AppAssets.venue,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  GameInfoWidget(
                                      title: "Date",
                                      info: DateFormat('MMMM dd, yyyy').format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              (state.data.startTimestamp ?? 0) *
                                                  1000)),
                                      icon: AppAssets.calendar),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  GameInfoWidget(
                                      title: "Time",
                                      info: DateFormat('HH:mm').format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              (state.data.startTimestamp ?? 0) *
                                                  1000)),
                                      icon: AppAssets.clock),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  GameInfoWidget(
                                      title: "Referee",
                                      info: state.data.referee?.name ?? "",
                                      icon: AppAssets.referee),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                  GameInfoWidget(
                                    title: "Stadium Capacity",
                                    info: state.data.venue?.stadium?.capacity
                                            ?.toString() ??
                                        "",
                                    icon: AppAssets.stadium,
                                  ),
                                  SizedBox(
                                    height: 16.h,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 16.h,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}

class GameInfoWidget extends StatelessWidget {
  const GameInfoWidget({
    super.key,
    required this.title,
    required this.info,
    required this.icon,
  });
  final String title;
  final String info;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageLoader(
          height: 20.w,
          width: 20.w,
          path: icon,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 16.w,
        ),
        AppText.bodyMedium(
          title,
          color: Pallet.greyColor.shade400,
        ),
        Spacer(),
        AppText.labelMedium(
          info,
          color: Pallet.blackColor,
        )
      ],
    );
  }
}
