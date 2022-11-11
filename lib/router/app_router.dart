import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graildo_assessment/features/day_view/presentation/pages/day_view_page.dart';
import 'package:graildo_assessment/router/routes.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.dayView:
        return MaterialPageRoute(builder: ((context) => const DayViewPage()));
    }
  }
}
