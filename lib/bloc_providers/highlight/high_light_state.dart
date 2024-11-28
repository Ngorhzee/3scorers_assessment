part of 'high_light_bloc.dart';

@immutable
sealed class HighLightState {}

final class HighLightInitial extends HighLightState {
  
}

final class HighlightData extends HighLightState {
  final HighlightModel highlightData;

  HighlightData({required this.highlightData});
}
