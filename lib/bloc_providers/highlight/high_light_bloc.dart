import 'package:bloc/bloc.dart';
import 'package:livesscore/core/utils/locator.dart';
import 'package:livesscore/models/highlight_model.dart';
import 'package:livesscore/services/match_details_services.dart';
import 'package:meta/meta.dart';

part 'high_light_event.dart';
part 'high_light_state.dart';

class HighLightBloc extends Bloc<HighLightEvent, HighLightState> {
  HighLightBloc() : super(HighLightInitial()) {
         MatchDetailsServices matchDetailsServices = locator();
    on<HighLightEvent>((event, emit) {
      if (event is GetHighlight) {
        try {
         
         
         
          HighlightModel highlightData =  matchDetailsServices.getHighlight();
          emit(HighlightData(highlightData: highlightData));
        } catch (e) {
         
         
        }
      }
    });
  }
}
