


import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';

class AppBlocObserver extends BlocObserver
{
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('On change --- $bloc and the change= $change');
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    log('On close --- $bloc');
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    log('On create --- $bloc');
  }


  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc,error,stackTrace);
    log('On Error --- $bloc and the error= $error');
  }


}