


import 'package:clean_architecture_idea_app/core/common/app_theme.dart';
import 'package:clean_architecture_idea_app/core/router/app_router.dart';
import 'package:flutter/material.dart';

class MiniCommunityApp extends StatelessWidget {
  const MiniCommunityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Community App",
      onGenerateRoute: AppRouter.onGenerateRoutes,
      theme: AppTheme.ourTheme
    );
  }
}
