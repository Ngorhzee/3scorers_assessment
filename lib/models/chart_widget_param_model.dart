import 'package:flutter/material.dart';

class ChartViewParaModel {
  final String homeTeamBlob;
  final String awayTeamBlob;
  final Color awayColor;
  final Color homeColor;
  final num homePossesion;
  final num awayPosseion;

  ChartViewParaModel({required this.homeTeamBlob, required this.awayTeamBlob, required this.awayColor, required this.homeColor, required this.homePossesion, required this.awayPosseion});
}
