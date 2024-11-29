import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livesscore/bloc_providers/incidents/incidents_bloc.dart';
import 'package:livesscore/core/constants/app_assets.dart';
import 'package:livesscore/core/constants/app_colors.dart';
import 'package:livesscore/core/constants/data.dart';
import 'package:livesscore/core/utils/utils.dart';
import 'package:livesscore/models/incidents_model.dart';
import 'package:livesscore/views/matches/widgets/player_widget.dart';
import 'package:livesscore/widgets/app_text.dart';
import 'package:livesscore/widgets/image_loader.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MatchStatsWidget extends StatefulWidget {
  const MatchStatsWidget(
      {super.key, required this.homeTeamBlob, required this.awayTeamBlob});
  final String homeTeamBlob;
  final String awayTeamBlob;
  @override
  State<MatchStatsWidget> createState() => _MatchStatsWidgetState();
}

class _MatchStatsWidgetState extends State<MatchStatsWidget> {
  @override
  void initState() {
    context.read<IncidentsBloc>().add(GetIncidents());
    super.initState();
  }

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageLoader(
                  height: 24.w,
                  width: 24.w,
                  fit: BoxFit.cover,
                  blob: convertToBlobImage(widget.homeTeamBlob),
                ),
                AppText.headlineMedium(
                  "Match Current Stats",
                  color: Pallet.white,
                  fontSize: 14.sp,
                ),
                ImageLoader(
                  height: 24.w,
                  width: 24.w,
                  fit: BoxFit.cover,
                  blob: convertToBlobImage(widget.awayTeamBlob),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          BlocBuilder<IncidentsBloc, IncidentsState>(
            builder: (context, state) {
              if (state is IncidentsData) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: <Widget>[
                      buildHeader(
                          "Penalties ${state.period[0].homeScore} - ${state.period[0].awayScore}"),
                      TimelineFootball(
                        incident: state.incidentList[0],
                        isPenalty: true,
                      ),
                      buildHeader(
                          "Extra - Time ${state.period[1].homeScore} - ${state.period[1].awayScore}"),
                      TimelineFootball(incident: state.incidentList[1]),
                      buildHeader(
                          "End of 90 minutues ${state.period[2].homeScore} - ${state.period[2].awayScore}"),
                      TimelineFootball(incident: state.incidentList[2]),
                      buildHeader(
                          "Half Time ${state.period.last.homeScore} - ${state.period.last.awayScore}"),
                      TimelineFootball(incident: state.incidentList[3]),
                      SizedBox(
                        height: 16.h,
                      )
                    ],
                  ),
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }

  Widget buildHeader(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Pallet.greyColor.shade500),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText.bodySmall(
            title,
            color: Pallet.greyColor.shade400,
            fontSize: 11.sp,
          ),
        ],
      ),
    );
  }
}

class TimelineFootball extends StatelessWidget {
  const TimelineFootball(
      {super.key, required this.incident, this.isPenalty = false});

  final List<Incident> incident;
  final bool isPenalty;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(isPenalty ? incident.length ~/ 2 : incident.length,
            (index) {
          final Incident event = incident[index];

          bool isLeftChild = event.isHome ?? false;

          return TimelineTile(
            alignment: TimelineAlign.center,
            endChild: isPenalty
                ? buildIconbyIncident(
                    index == 0 ? incident[index] : incident[index * 2])
                : isLeftChild
                    ? null
                    : buildIconbyIncident(event),
            startChild: isPenalty
                ? buildIconbyIncident(index == 0
                    ? incident[index + 1]
                    : incident[(index * 2) - 1])
                : isLeftChild
                    ? buildIconbyIncident(event)
                    : null,
            indicatorStyle: IndicatorStyle(
              // width: 40,
              // height: 40,
              indicator: TimelineFootballIndicator(
                  time: event.time?.toString() ?? (5 - index).toString()),
              drawGap: true,
            ),
            // afterLineStyle: const LineStyle(
            //   color: Pallet.primaryColor,
            //   thickness: 1,
            // ),
            beforeLineStyle: const LineStyle(
              color: Pallet.primaryColor,
              thickness: 1,
            ),
          );
        })
      ],
    );
  }

  Widget buildIconbyIncident(Incident incident) {
    switch (incident.incidentType?.name) {
      case "penaltyShootout":
        List<Widget> children = [
          PlayerWidget(
            playerName: incident.player?.shortName ?? "",
            isHome: incident.isHome ?? false,
          ),
          const Spacer(),
          ImageLoader(
            height: 20.w,
            width: 20.w,
            path: incident.incidentClass == "missed"
                ? AppAssets.notScored
                : AppAssets.scored,
            dColor: Pallet.blackColor,
            fit: BoxFit.cover,
          ),
        ];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  incident.isHome! ? children : children.reversed.toList(),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        );
      case "goal":
        return (incident.isHome ?? false)
            ? Row(
                children: [
                  PlayerWidget(
                    playerName: incident.player?.shortName ?? "",
                    isHome: true,
                  ),
                  const Spacer(),
                  ImageLoader(
                    height: 20.w,
                    width: 20.w,
                    path: AppAssets.ball,
                    dColor: Pallet.blackColor,
                    fit: BoxFit.cover,
                  ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 8.w,
                  ),
                  ImageLoader(
                    height: 20.w,
                    width: 20.w,
                    path: AppAssets.ball,
                    dColor: Pallet.blackColor,
                    fit: BoxFit.cover,
                  ),
                  const Spacer(),
                  PlayerWidget(
                    playerName: incident.player?.shortName ?? "",
                    isHome: false,
                  ),
                ],
              );
      case "card":
        return (incident.isHome ?? true)
            ? Row(
                children: [
                  PlayerWidget(
                    playerName: incident.player?.shortName ?? "",
                    reason: incident.reason?.name ?? "",
                    isHome: true,
                  ),
                  const Spacer(),
                  Container(
                    width: 13.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.r),
                        color: incident.incidentClass == "yellow"
                            ? const Color(0xffFFE500)
                            : const Color(0xffEF222A)),
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 8.w,
                  ),
                  Container(
                    width: 13.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.r),
                        color: incident.incidentClass == "yellow"
                            ? const Color(0xffFFE500)
                            : const Color(0xffEF222A)),
                  ),
                  const Spacer(),
                  PlayerWidget(
                    playerName: incident.player?.shortName ?? "",
                    reason: incident.reason?.name ?? "",
                    isHome: false,
                  ),
                ],
              );

      case "substitution":
        List<Widget> children = [
          Column(
            crossAxisAlignment: incident.isHome!
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.arrow_forward,
                    color: Pallet.primaryText,
                    size: 12.sp,
                  ),
                  SizedBox(
                    width: .5.w,
                  ),
                  AppText.bodyMedium(
                    incident.playerIn?.shortName ?? "",
                    color: Pallet.primaryText,
                  )
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Pallet.red,
                    size: 12.sp,
                  ),
                  SizedBox(
                    width: .5.w,
                  ),
                  AppText.bodyMedium(
                    incident.playerOut?.shortName ?? "",
                    color: Pallet.red,
                  )
                ],
              ),
            ],
          ),
          const Spacer(),
          ImageLoader(
            height: 20.w,
            width: 20.w,
            path: AppAssets.sub,
            fit: BoxFit.cover,
          ),
        ];
        return Row(
            children: incident.isHome! ? children : children.reversed.toList());
      default:
        return const SizedBox();
    }
  }
}

class TimelineFootballIndicator extends StatelessWidget {
  const TimelineFootballIndicator({super.key, required this.time});

  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 20.w, minHeight: 20.w),
      decoration: const BoxDecoration(
        color: Pallet.primaryColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: AppText.headlineMedium(
          time,
          fontSize: 11.sp,
          color: Pallet.white,
        ),
      ),
    );
  }
}
