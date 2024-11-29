import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livesscore/bloc_providers/chart/chart_bloc.dart';

import 'package:livesscore/bloc_providers/matchstats/match_stats_bloc.dart';
import 'package:livesscore/core/constants/app_colors.dart';
import 'package:livesscore/core/utils/utils.dart';
import 'package:livesscore/widgets/app_text.dart';
import 'package:livesscore/widgets/dashboard_container_widget.dart';
import 'package:livesscore/widgets/image_loader.dart';
import 'package:shimmer/shimmer.dart';


class ChartWidget extends StatefulWidget {
  const ChartWidget(
      {super.key,
      required this.homeTeamBlob,
      required this.awayTeamBlob,
      required this.homeColor,
      required this.awayColor});
  final String homeTeamBlob;
  final String awayTeamBlob;
  final Color homeColor;
  final Color awayColor;
  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  @override
  void initState() {
    context.read<ChartBloc>().add(LoadChartData());
    context.read<MatchStatsBloc>().add(LoadMatchStats());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DasboardContainerWidget(
      miniChild: Row(
        children: [
          AppText.headlineMedium(
            "Live Match Momentum",
            color: Pallet.white,
            fontSize: 14.sp,
          ),
        ],
      ),
      child: Column(
        children: [
          BlocBuilder<MatchStatsBloc, MatchStatsState>(
            builder: (context, state) {
              if (state is MatchStats) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText.labelMedium(
                            state.matchOverView.home ?? "",
                            color: Pallet.blackColor,
                          ),
                          AppText.bodySmall(
                            "Ball Possession",
                            color: Pallet.greyColor.shade400,
                          ),
                          AppText.labelMedium(
                            state.matchOverView.away ?? "",
                            color: Pallet.blackColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Container(
                        width: 1.sw,
                        height: 4.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration.zero,
                              width: (state.matchOverView.homeValue! / 100) *
                                  (1.sw - 64.w),
                              decoration: BoxDecoration(
                                color: widget.homeColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  bottomLeft: Radius.circular(10.r),
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              duration: Duration.zero,
                              width: (state.matchOverView.awayValue! / 100) *
                                  (1.sw - 64.w),
                              decoration: BoxDecoration(
                                color: widget.awayColor,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10.r),
                                  topRight: Radius.circular(10.r),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }
              return const SizedBox();
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 16.w,
              ),
              Column(
                children: [
                  ImageLoader(
                    height: 20.w,
                    width: 20.w,
                    fit: BoxFit.cover,
                    blob: convertToBlobImage(widget.homeTeamBlob),
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  ImageLoader(
                    height: 20.w,
                    width: 20.w,
                    fit: BoxFit.cover,
                    blob: convertToBlobImage(widget.awayTeamBlob),
                  ),
                ],
              ),
              SizedBox(
                width: 14.w,
              ),
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      height: 140.h,
                      width: 1.sw,
                      child: Column(
                        children: [
                          Expanded(
                              child: Container(
                            color: widget.homeColor.withOpacity(.5),
                          )),
                          Expanded(
                              child: Container(
                            color: widget.awayColor.withOpacity(.5),
                          )),
                        ],
                      ),
                    ),
                    BlocBuilder<ChartBloc, ChartState>(
                      builder: (context, state) {
                        if (state is ChartLoading) {
                          return Shimmer.fromColors(
                              baseColor: Pallet.greyColor.shade400,
                              highlightColor: Pallet.greyColor.shade500,
                              child: Container(
                                height: 140.h,
                                width: 1.sw,
                              ));
                        }
                        if (state is ChartDataSuccess) {
                          return SizedBox(
                            height: 140.h,
                            width: 1.sw,
                            child:
                                BarChart(
                              BarChartData(
                                maxY: 10,
                                minY: -10,
                                groupsSpace: 10.w,
                                barGroups: state.chartData.graphPoints
                                    .map((entry) => BarChartGroupData(
                                          x: entry.minute.toInt(),
                                          barRods: [
                                            BarChartRodData(
                                              borderRadius:
                                                  BorderRadius.circular(0),
                                              toY:
                                                  (entry.value / 10).toDouble(),
                                              color: entry.value >= 0
                                                  ? widget.homeColor
                                                  : widget.awayColor,
                                              width: 5.w,
                                            ),
                                          ],
                                        ))
                                    .toList(),
                                titlesData: const FlTitlesData(
                                  leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                    showTitles: false,
                                    reservedSize: 28,
                                  )),
                                  topTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                    showTitles: false,
                                  )),
                                  bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                    showTitles: false,
                                  )),
                                  rightTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                    showTitles: false,
                                  )),
                                ),
                                gridData: const FlGridData(show: false),
                                borderData: FlBorderData(show: false),
                                backgroundColor: Colors.transparent,
                                alignment: BarChartAlignment.spaceAround,
                              ),
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          )

          // : SizedBox()
        ],
      ),
    );
  }
}
