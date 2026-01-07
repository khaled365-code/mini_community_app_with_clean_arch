


import 'package:shared_preferences/shared_preferences.dart';

class CacheService
{

  CacheService._named();

  static CacheService? _instance;

  factory CacheService() => _instance ??= CacheService._named(); // lazy singleton construction


  late SharedPreferences _sharedInstance;


  Future<void> init() async
  {
    _sharedInstance= await SharedPreferences.getInstance();
  }


  Future<void> setString({required String key,required String value}) async
  {
    await _sharedInstance.setString(key, value);
  }


  Future<void> setBool({required String key,required bool value}) async
  {
    await _sharedInstance.setBool(key,value);
  }


  String? getString({required String key})
  {
    return _sharedInstance.getString(key);
  }

  bool getBool({required String key})
  {
    return _sharedInstance.getBool(key)??false;
  }








}