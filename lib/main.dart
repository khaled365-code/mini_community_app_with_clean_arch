import 'package:clean_architecture_idea_app/core/common/bloc_observer.dart';
import 'package:clean_architecture_idea_app/mini_community_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async
{

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  Bloc.observer=AppBlocObserver();
  runApp(const MiniCommunityApp());

}


