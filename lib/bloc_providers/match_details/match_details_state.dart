part of 'match_details_bloc.dart';

@immutable
sealed class MatchDetailsState {}

final class MatchDetailsInitial extends MatchDetailsState {}

final class MatchDetailsLoading extends MatchDetailsState {}

final class MatchDetailsData extends MatchDetailsState {
 final MatchDetailsModel data;

  MatchDetailsData({required this.data});
}






