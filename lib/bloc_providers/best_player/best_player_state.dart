part of 'best_player_bloc.dart';

@immutable
sealed class BestPlayerState {}

final class BestPlayerInitial extends BestPlayerState {}
final class BestPlayerData extends BestPlayerState {
 final BestPlayerModel data;

  BestPlayerData({required this.data});
}
