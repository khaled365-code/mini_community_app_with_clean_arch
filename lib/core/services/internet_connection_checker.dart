


import 'package:clean_architecture_idea_app/core/errors/exceptions.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectionService
{

  InternetConnectionService._named();

  static InternetConnectionService? _instance;

  factory InternetConnectionService()=> _instance ??= InternetConnectionService._named();

  // lazy singleton construction

  late InternetConnectionChecker instance;

  void initialize()
  {
    instance = InternetConnectionChecker.instance;
  }

  Future<bool> checkConnection() async
  {
    final bool isConnected = await instance.hasConnection;
    return isConnected? true:throw NetworkException(message: 'No Internet');
  }


}