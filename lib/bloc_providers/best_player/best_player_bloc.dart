import 'package:bloc/bloc.dart';
import 'package:livesscore/core/utils/locator.dart';
import 'package:livesscore/models/best_player_model.dart';
import 'package:livesscore/services/match_details_services.dart';
import 'package:meta/meta.dart';

part 'best_player_event.dart';
part 'best_player_state.dart';

class BestPlayerBloc extends Bloc<BestPlayerEvent, BestPlayerState> {
  BestPlayerBloc() : super(BestPlayerInitial()) {
     MatchDetailsServices matchDetailsServices = locator();
    on<BestPlayerEvent>((event, emit) {
      if(event is LoadBestPlayer){
    try{
        
        BestPlayerModel data =  matchDetailsServices.getBestPlayer();
        emit(BestPlayerData(data: data));
      } catch (e) {
       
         // emit(ChartError(message: e.toString()));
        }
  }

    });
  }
}
