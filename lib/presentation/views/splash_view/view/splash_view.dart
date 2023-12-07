import 'package:flutter/material.dart';
import 'package:tmbd/utilities/constants/color_constants/color_constants.dart';
import 'package:tmbd/utilities/constants/route_constants/route_constants.dart';
import 'package:tmbd/utilities/constants/text_style_constants/text_style_constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(context, RouteConstants.homeView),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants().darkGrey,
      body: Center(
        child: Text("TMDB", style: TextStyleConstants().w800s20White),
      ),
    );
  }
}
