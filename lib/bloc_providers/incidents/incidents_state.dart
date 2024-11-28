part of 'incidents_bloc.dart';

@immutable
sealed class IncidentsState {}

final class IncidentsInitial extends IncidentsState {}

final class IncidentsData extends IncidentsState {
  final List<List<Incident>> incidentList;
  final List<Incident> period;

  IncidentsData({
    required this.incidentList,
    required this.period,
  });
}
