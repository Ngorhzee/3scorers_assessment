import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livesscore/bloc_providers/best_player/best_player_bloc.dart';
import 'package:livesscore/bloc_providers/chart/chart_bloc.dart';
import 'package:livesscore/bloc_providers/highlight/high_light_bloc.dart';
import 'package:livesscore/bloc_providers/incidents/incidents_bloc.dart';
import 'package:livesscore/bloc_providers/match_details/match_details_bloc.dart';
import 'package:livesscore/bloc_providers/matchstats/match_stats_bloc.dart';
import 'package:livesscore/core/constants/app_colors.dart';
import 'package:livesscore/core/utils/locator.dart';
import 'package:livesscore/views/splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MatchDetailsBloc>(
          create: (_) => MatchDetailsBloc(),
        ),
        BlocProvider<ChartBloc>(
          create: (_) => ChartBloc(),
        ),
        BlocProvider<MatchStatsBloc>(
          create: (_) => MatchStatsBloc(),
        ),
        BlocProvider<IncidentsBloc>(
          create: (_) => IncidentsBloc(),
        ),
        BlocProvider<HighLightBloc>(
          create: (_) => HighLightBloc(),
        ),
        BlocProvider<BestPlayerBloc>(
          create: (_) => BestPlayerBloc(),
        )
      ],
      child: ScreenUtilInit(
          designSize: const Size(430.13, 932),
          builder: (context, _) {
            return MaterialApp(
              title: '3Scorers',
              theme: ThemeData(
                scaffoldBackgroundColor: Pallet.white,
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
                useMaterial3: true,
              ),
              home: const SplashView(),
              debugShowCheckedModeBanner: false,
            );
          }),
    );
  }
}
