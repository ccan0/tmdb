import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tmbd/core/route/app_routes.dart';
import 'package:tmbd/presentation/views/splash_view/view/splash_view.dart';
import 'package:tmbd/utilities/constants/route_constants/route_constants.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        title: 'TMDB',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteConstants.initial,
        routes: AppRoutes().appRoutes,
        home: const SplashView(),
      ),
    );
  }

  const MyApp({super.key});
}
