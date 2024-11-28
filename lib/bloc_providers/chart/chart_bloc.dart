import 'package:bloc/bloc.dart';
import 'package:livesscore/core/utils/locator.dart';
import 'package:livesscore/models/chart_model.dart';
import 'package:livesscore/services/match_details_services.dart';
import 'package:meta/meta.dart';

part 'chart_event.dart';
part 'chart_state.dart';

class ChartBloc extends Bloc<ChartEvent, ChartState> {
  ChartBloc() : super(ChartInitial()) {
     MatchDetailsServices matchDetailsServices = locator();
    on<ChartEvent>((event, emit) async{
     if (event is LoadChartData) {
        try {
         
          emit(ChartLoading());
         
          ChartModel chartData = await matchDetailsServices.loadChartData();
          emit(ChartDataSuccess(chartData: chartData));
        } catch (e) {
         
          emit(ChartError(message: e.toString()));
        }
      }
    });
  }
}
