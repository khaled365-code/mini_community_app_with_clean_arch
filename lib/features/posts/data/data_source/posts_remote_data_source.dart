


import 'dart:convert';

import 'package:clean_architecture_idea_app/core/services/api/api_consumer.dart';
import 'package:clean_architecture_idea_app/core/services/api/end_points.dart';
import 'package:clean_architecture_idea_app/features/posts/data/models/get_posts_model.dart';
import 'package:dartz/dartz.dart';

abstract class PostsRemoteDataSource
{

   Future<List<PostsModel>>getPosts();
   Future<Unit> addPost({required PostsModel postsModel});
   Future<Unit> updatePost({required PostsModel postsModel});
   Future<Unit> deletePost({required num postId});
}


class PostsRemoteDataSourceImplWithHttp implements PostsRemoteDataSource
{
  final ApiConsumer apiConsumer;
  const PostsRemoteDataSourceImplWithHttp({required this.apiConsumer});

  @override
  Future<List<PostsModel>> getPosts() async
  {
      final response=await apiConsumer.get(EndPoints.getPosts);
      List<PostsModel> postsModelList=
      List.from(jsonDecode(response).map<PostsModel>((item)=>PostsModel.fromJson(item)).toList());
      return postsModelList;
  }

  @override
  Future<Unit> addPost({required PostsModel postsModel}) async
  {
     final response=await apiConsumer.post(EndPoints.addPost,data: postsModel.toJson());
     return Future.value(unit);
  }

  @override
  Future<Unit> deletePost({required num postId}) async {
    final response=await apiConsumer.delete(EndPoints.deletePost(postId: postId));
    return Future.value(unit);

  }

  @override
  Future<Unit> updatePost({required PostsModel postsModel}) async {
    final response=await apiConsumer.patch(EndPoints.updatePost(postId: postsModel.postId??0),data: postsModel.toJson());
    return Future.value(unit);
  }








}