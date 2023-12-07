class RouteConstants {
  static final RouteConstants _instance = RouteConstants._internal();

  factory RouteConstants() {
    return _instance;
  }

  RouteConstants._internal();

  static const String initial = "/";
  static const String homeView = "/home_view";
  static const String detailView = "/detail_view";
}