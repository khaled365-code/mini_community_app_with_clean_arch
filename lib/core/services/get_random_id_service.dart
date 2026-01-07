

import 'package:uuid/uuid.dart';

class GetRandomIdService
{

  GetRandomIdService._named();

  static GetRandomIdService? _instance;


  factory GetRandomIdService() => _instance ??= GetRandomIdService._named();

  late Uuid uuid;

  void initializeUUID()
  {
    uuid = Uuid();
  }

  String getRandomNumber()
  {
    return uuid.v4();
  }






}