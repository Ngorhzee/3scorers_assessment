import 'package:bloc/bloc.dart';
import 'package:livesscore/core/utils/locator.dart';
import 'package:livesscore/models/best_player_model.dart';
import 'package:livesscore/models/chart_model.dart';
import 'package:livesscore/models/match_details_model.dart';
import 'package:livesscore/models/stat_item_model.dart';
import 'package:livesscore/services/match_details_services.dart';
import 'package:meta/meta.dart';

part 'match_details_event.dart';
part 'match_details_state.dart';

class MatchDetailsBloc extends Bloc<MatchDetailsEvent, MatchDetailsState> {
  MatchDetailsBloc() : super(MatchDetailsInitial()) {
       MatchDetailsServices matchDetailsServices = locator();
    on<MatchDetailsEvent>((event, emit) async{
     
    if(event is LoadMatchDetail){
      try{
        emit(MatchDetailsLoading());
        MatchDetailsModel data = await matchDetailsServices.LoadMatchDetails();
        emit(MatchDetailsData(data: data));
      } catch (e) {
       
         // emit(ChartError(message: e.toString()));
        }
    }
    
       });
  }
 
}
