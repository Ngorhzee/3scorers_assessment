import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livesscore/core/constants/app_assets.dart';
import 'package:livesscore/core/constants/app_colors.dart';
import 'package:livesscore/views/base_view/base_view.dart';
import 'package:livesscore/views/matches/matches_view.dart';
import 'package:livesscore/widgets/image_loader.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
        Duration(seconds: 2),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BaseView())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Pallet.tabGreen.withOpacity(.5), BlendMode.darken),
            image: AssetImage(AppAssets.pitch),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ImageLoader(
            path: AppAssets.logo,
            height: 78.w,
            width: 100.w,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
