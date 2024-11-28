import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:livesscore/core/constants/data.dart';
import 'package:livesscore/models/best_player_model.dart';
import 'package:livesscore/models/chart_model.dart';
import 'package:livesscore/models/highlight_model.dart';
import 'package:livesscore/models/incidents_model.dart';
import 'package:livesscore/models/match_details_model.dart';
import 'package:livesscore/models/stat_item_model.dart';

import '../core/constants/app_assets.dart';

class MatchDetailsServices {
  Future<MatchDetailsModel> LoadMatchDetails() async {
    //Load the match details
    String jsonString = await rootBundle.loadString(AppAssets.matchDetails);

    //decode the match details
    Map<String, dynamic> jsonData = json.decode(jsonString);

    // convert to match details
    return MatchDetailsModel.fromJson(jsonData["data"]["event"]);
  }

  Future<ChartModel> loadChartData() async {
    //Load the chart data
    String jsonString = await rootBundle.loadString(AppAssets.chartData);

    //decode the chart data
    Map<String, dynamic> jsonData = json.decode(jsonString);

    // convert to chart model
    return ChartModel.fromJson(jsonData["data"]);
  }

  Future<StatisticsItem> getMatchOverview() async {
    //Load the chart data
    String jsonString = await rootBundle.loadString(AppAssets.matchstats);

    //decode the chart data
    Map<String, dynamic> jsonData = json.decode(jsonString);

    // convert to chart model
    return StatisticsItem.fromJson(
        jsonData["data"]["statistics"][0]["groups"][0]["statisticsItems"][0]);
  }

  IncidentModel getIncidence()  {
 

      return IncidentModel.fromJson(incidents);

  }

  HighlightModel getHighlight()  {
 

      return HighlightModel.fromJson(highlight);

  }

  BestPlayerModel getBestPlayer()  {
 

      return BestPlayerModel.fromJson(bestPlayer);

  }
}
