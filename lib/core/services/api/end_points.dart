


abstract class EndPoints
{

  static const String baseUrl='https://jsonplaceholder.typicode.com/';

  static const String getPosts='${baseUrl}posts';

  static const String addPost='${baseUrl}posts';

  static String updatePost({required num postId})
  {
    return '${baseUrl}posts/$postId';
  }

  static String deletePost({required num postId})
  {
    return '${baseUrl}posts/$postId';
  }



}


