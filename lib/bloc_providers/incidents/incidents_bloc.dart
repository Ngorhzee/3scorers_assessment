import 'package:bloc/bloc.dart';
import 'package:livesscore/core/utils/locator.dart';
import 'package:livesscore/models/incidents_model.dart';
import 'package:livesscore/services/match_details_services.dart';
import 'package:meta/meta.dart';

part 'incidents_event.dart';
part 'incidents_state.dart';

class IncidentsBloc extends Bloc<IncidentsEvent, IncidentsState> {
  IncidentsBloc() : super(IncidentsInitial()) {
    MatchDetailsServices matchDetailsServices = locator();
    on<IncidentsEvent>((event, emit) async {
      if (event is GetIncidents) {
        List<List<Incident>> result = [];
        List<Incident> currentSublist = [];
        List<Incident> periods = [];
        try {
          IncidentModel data = matchDetailsServices.getIncidence();
          periods.add(data.incidents.first);
          for (int i = 1; i < data.incidents.length; i++) {
            Incident item = data.incidents[i];

            if (item.incidentType == IncidentType.period) {
              periods.add(item);
              if (currentSublist.isNotEmpty) {
                print(currentSublist.length);
                result.add(List.from(currentSublist));
                currentSublist.clear();
              }
            } else {
              if (item.incidentType != IncidentType.injuryTime) {
                currentSublist.add(item);
              }
            }
          }

          if (currentSublist.isNotEmpty) {
            result.add(List.from(currentSublist));
          }
          print(result);

          emit(IncidentsData(incidentList: result, period: periods));
        } catch (e, s) {}
      }
    });
  }
}
