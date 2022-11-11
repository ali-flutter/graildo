import 'package:graildo_assessment/router/app_router.dart';
import 'package:graildo_assessment/style/app_colors.dart';
import 'package:graildo_assessment/style/app_theme.dart';
import 'package:in_date_utils/in_date_utils.dart' as dt;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
