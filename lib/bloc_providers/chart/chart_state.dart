part of 'chart_bloc.dart';

@immutable
sealed class ChartState {}

final class ChartInitial extends ChartState {}
final class ChartLoading extends ChartState {}
final class ChartDataSuccess extends ChartState {
  final ChartModel chartData;

  ChartDataSuccess({required this.chartData});
}
final class ChartError extends ChartState {
  final String message;

  ChartError({required this.message});
}