


import 'package:clean_architecture_idea_app/core/router/routes.dart';
import 'package:clean_architecture_idea_app/features/posts/presentation/views/screens/all_posts_screen.dart';
import 'package:flutter/material.dart';

abstract class AppRouter
{

  static Route onGenerateRoutes(RouteSettings settings)
  {
    switch(settings.name)
    {
      case Routes.allPostsScreen:
        return _buildScreen(widget: AllPostsScreen());

      default:
        return _buildDefaultScreen();


    }



  }


  static MaterialPageRoute _buildScreen({required Widget widget,RouteSettings? settings})=>
  MaterialPageRoute(builder: (_) => widget,settings: settings);


  static MaterialPageRoute _buildDefaultScreen()=>
      MaterialPageRoute(builder: (_)=>
      Scaffold(
        body: SafeArea(child: Center(child: Text('Wrong route defined'),)),
      ));


}