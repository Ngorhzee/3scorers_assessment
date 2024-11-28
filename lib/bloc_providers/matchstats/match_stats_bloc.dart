import 'package:bloc/bloc.dart';
import 'package:livesscore/core/utils/locator.dart';
import 'package:livesscore/models/stat_item_model.dart';
import 'package:livesscore/services/match_details_services.dart';
import 'package:meta/meta.dart';

part 'match_stats_event.dart';
part 'match_stats_state.dart';

class MatchStatsBloc extends Bloc<MatchStatsEvent, MatchStatsState> {
  MatchStatsBloc() : super(MatchStatsInitial()) {
        MatchDetailsServices matchDetailsServices = locator();
    on<MatchStatsEvent>((event, emit) async{
      if(event is LoadMatchStats){
      try{
        emit(StatLoading());
        StatisticsItem data = await matchDetailsServices.getMatchOverview();
        emit(MatchStats(matchOverView: data));
      } catch (e) {
       
         // emit(ChartError(message: e.toString()));
        }
    }

    });
  }
}
