part of 'match_stats_bloc.dart';

@immutable
sealed class MatchStatsState {}

final class MatchStatsInitial extends MatchStatsState {}
final class StatLoading extends MatchStatsState {}



final class MatchStats extends MatchStatsState {
  final StatisticsItem matchOverView;

  MatchStats({required this.matchOverView});
}