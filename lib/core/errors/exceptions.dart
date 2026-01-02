

class ServerException implements Exception {

  final String message;
  const ServerException({required this.message});

}


class EmptyCacheException implements Exception {

  final String message;
  const EmptyCacheException({required this.message});
}






class NetworkException implements Exception {

  final String message;
  const NetworkException({required this.message});

}