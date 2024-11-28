import 'package:get_it/get_it.dart';
import 'package:livesscore/services/match_details_services.dart';

GetIt locator = GetIt.instance;
Future<void> setupLocator() async {
 


// services

  locator.registerLazySingleton<MatchDetailsServices>(
    () => MatchDetailsServices(),
  );
}