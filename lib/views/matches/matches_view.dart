import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:livesscore/bloc_providers/match_details/match_details_bloc.dart';
import 'package:livesscore/core/constants/app_assets.dart';
import 'package:livesscore/core/constants/app_colors.dart';
import 'package:livesscore/core/constants/data.dart';
import 'package:livesscore/core/constants/text_styles.dart';
import 'package:livesscore/core/utils/utils.dart';
import 'package:livesscore/models/league_model.dart';
import 'package:livesscore/views/matches/match_details_view.dart';
import 'package:livesscore/views/matches/widgets/club_intro_widget.dart';
import 'package:livesscore/views/matches/widgets/league_category_widget.dart';
import 'package:livesscore/views/matches/widgets/pitch_background_widget.dart';
import 'package:livesscore/widgets/app_text.dart';
import 'package:livesscore/widgets/custom_tabbar_widget.dart';
import 'package:livesscore/widgets/image_loader.dart';

class MatchesView extends StatefulWidget {
  const MatchesView({super.key});

  @override
  State<MatchesView> createState() => _MatchesViewState();
}

class _MatchesViewState extends State<MatchesView> {
  List<LeagueModel> leagues = [
    LeagueModel(name: "All", icon: AppAssets.globe, id: 0),
    LeagueModel(name: "EPL", icon: AppAssets.pl, id: 1),
    LeagueModel(name: "La Liga", icon: AppAssets.laliga, id: 2),
    LeagueModel(name: "Serie A", icon: AppAssets.serieA, id: 3),
    LeagueModel(name: "Bundesliga", icon: AppAssets.bundesliga, id: 4),
    LeagueModel(name: "Ligue 1", icon: AppAssets.ligue1, id: 5),
  ];
  List<String> tabs = ["Live Matches", "New Matches", "Past Matches"];
  int selectedIndex = 0;
  @override
  void initState() {
    context.read<MatchDetailsBloc>().add(LoadMatchDetail());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            PitchBackgroundWidget(
              image: AppAssets.pitch,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ImageLoader(
                              height: 24.w,
                              width: 24.w,
                              path: AppAssets.menu,
                              fit: BoxFit.cover,
                            ),
                            Row(
                              children: [
                                ImageLoader(
                                  path: AppAssets.logo,
                                  height: 38.w,
                                  width: 60.w,
                                  fit: BoxFit.fitHeight,
                                ),
                                SizedBox(
                                  width: 37.w,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8.w, vertical: 7.h),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Pallet.greyColor, width: 1.h),
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  child: Row(
                                    children: [
                                      ImageLoader(
                                        height: 20.w,
                                        width: 20.w,
                                        path: AppAssets.search,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(
                                        width: 4.w,
                                      ),
                                      AppText.labelLarge(
                                        "Search...",
                                        fontSize: 16.sp,
                                        color: Pallet.greyColor,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 36.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ...List.generate(
                              leagues.length,
                              (index) => LeagueCategoryWidget(
                                isActive: selectedIndex == index,
                                league: leagues[index],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                  CustomTabbarWidget(tabs: tabs)
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MatchDetailsView())),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Pallet.offWhite,
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(2, 8),
                        color: Pallet.shadowColor.withOpacity(.2),
                        blurRadius: 20.r,
                        spreadRadius: 0)
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        10.r,
                      ),
                      topRight: Radius.circular(
                        10.r,
                      )),
                ),
                child: BlocBuilder<MatchDetailsBloc, MatchDetailsState>(
                  builder: (context, state) {
                    if (state is MatchDetailsData) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 10.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                      10.r,
                                    ),
                                    topRight: Radius.circular(
                                      10.r,
                                    )),
                                color: Pallet.primaryColor),
                            child: Row(
                              children: [
                                ImageLoader(
                                  height: 24.w,
                                  width: 24.w,
                                  blob: convertToBlobImage(leagueImage),
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                AppText.labelMedium(
                                  state.data.tournament?.uniqueTournament
                                          ?.name ??
                                      "",
                                  color: Pallet.white,
                                ),
                                const Spacer(),
                                // AppText.labelMedium(
                                //   "Game Week 15",
                                //   color: Pallet.white,
                                // )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClubIntroWidget(
                                  title: state.data.homeTeam?.name ?? "",
                                  blob: state.data.homeTeam?.logo ?? "",
                                ),
                                Column(
                                  children: [
                                    AppText.labelSmall(
                                        DateFormat('MMMM dd, yyyy').format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                (state.data.startTimestamp ??
                                                        0) *
                                                    1000))),
                                    AppText.labelLarge(
                                      "${state.data.homeScore?.normaltime} - ${state.data.awayScore?.normaltime} ",
                                      color: Pallet.blackColor,
                                    ),
                                    AppText.labelSmall("Full-time"),
                                  ],
                                ),
                                ClubIntroWidget(
                                  title: state.data.awayTeam?.name ?? "",
                                  blob: state.data.awayTeam?.logo ?? "",
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Divider(
                            color: Pallet.border,
                            thickness: 0.5.w,
                          ),
                          SizedBox(
                            height: 12.h,
                          )
                        ],
                      );
                    }
                    return SizedBox();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
