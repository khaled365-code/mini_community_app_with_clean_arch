

import 'dart:convert';

import 'package:clean_architecture_idea_app/core/common/app_constants.dart';
import 'package:clean_architecture_idea_app/core/errors/exceptions.dart';
import 'package:clean_architecture_idea_app/core/services/cache_service.dart';
import 'package:clean_architecture_idea_app/features/posts/data/models/get_posts_model.dart';
import 'package:dartz/dartz.dart';

abstract class PostsLocalDataSource
{

  Future<List<PostsModel>> getCachedPosts();
  Future<Unit> cacheAllPosts({required List<PostsModel> postsList});

}



class PostsLocalDataSourceWithSharedPref implements PostsLocalDataSource
{

  @override
  Future<List<PostsModel>> getCachedPosts() async
  {
    var cachedPosts =
    CacheService().getString(key: AppConstants.cachedPosts);
    if(cachedPosts!=null)
      {
       var decodePosts = jsonDecode(cachedPosts);
       List<PostsModel> postsList=decodePosts.map<PostsModel>((item)=>PostsModel.fromJson(item)).toList();
       return postsList;

      }
    else
      {
        throw EmptyCacheException(message: 'No cached Posts Found');

      }


  }

  @override
  Future<Unit> cacheAllPosts({required List<PostsModel> postsList})  async
  {
    List<Map<String,dynamic>> mappedPostsList= postsList.map<Map<String,dynamic>>((postsItem)=>postsItem.toJson()).toList();
    await CacheService().setString(key: AppConstants.cachedPosts, value: jsonEncode(mappedPostsList));
    return Future.value(unit);
  }


}


