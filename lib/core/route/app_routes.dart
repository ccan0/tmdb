import 'package:flutter/material.dart';
import 'package:tmbd/presentation/views/detail_view/view/detail_view.dart';
import 'package:tmbd/presentation/views/home_view/view/home_view.dart';
import 'package:tmbd/utilities/constants/route_constants/route_constants.dart';

class AppRoutes {
  Map <String, WidgetBuilder> appRoutes = {
    RouteConstants.homeView: (BuildContext context) => HomeView(),
    RouteConstants.detailView: (BuildContext context) => const DetailView(),
  };
}