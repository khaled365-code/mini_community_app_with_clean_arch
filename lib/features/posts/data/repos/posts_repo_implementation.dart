


import 'dart:convert';
import 'dart:math';

import 'package:clean_architecture_idea_app/core/errors/exceptions.dart';
import 'package:clean_architecture_idea_app/core/errors/failure.dart';
import 'package:clean_architecture_idea_app/core/services/api/api_consumer.dart';
import 'package:clean_architecture_idea_app/core/services/api/end_points.dart';
import 'package:clean_architecture_idea_app/core/services/get_random_id_service.dart';
import 'package:clean_architecture_idea_app/core/services/internet_connection_checker.dart';
import 'package:clean_architecture_idea_app/features/posts/data/data_source/posts_local_data_source.dart';
import 'package:clean_architecture_idea_app/features/posts/data/data_source/posts_remote_data_source.dart';
import 'package:clean_architecture_idea_app/features/posts/data/mappers/post_model_to_domain.dart';
import 'package:clean_architecture_idea_app/features/posts/data/models/get_posts_model.dart';
import 'package:clean_architecture_idea_app/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecture_idea_app/features/posts/domain/repos/posts_repo.dart';
import 'package:dartz/dartz.dart';


typedef  Future<Unit> ForAllSendingData();

class PostsRepoImplementation implements PostsRepo
{


  final PostsRemoteDataSource postsRemoteDataSource;
  final PostsLocalDataSource postsLocalDataSource;
  const PostsRepoImplementation({required this.postsRemoteDataSource,required this.postsLocalDataSource});

  @override
  Future<Either<Failure,List<PostEntity>>> getPosts() async
  {
       bool internetConnected = await InternetConnectionService().checkConnection();
       if(internetConnected)
         {
           try
           {
             List<PostsModel> postsModelList= await postsRemoteDataSource.getPosts();
             await postsLocalDataSource.cacheAllPosts(postsList: postsModelList);
             List<PostEntity> postEntityList =
             List.from(postsModelList.map<PostEntity>((item)=>PostModelToDomainMapper.convertPostModelToEntity(item)).toList());
             return Right(postEntityList);
           } on ServerException catch (e)
           {
             return Left(ServerFailure(message: e.message));
           }
         }
       else
         {
           try
           {
             List<PostsModel> postsModelList=await postsLocalDataSource.getCachedPosts();
             List<PostEntity> postEntityList =
             List.from(postsModelList.map((item)=>PostModelToDomainMapper.convertPostModelToEntity(item)).toList());
             return Right(postEntityList);
           } on EmptyCacheException catch (e)
           {
             return Left(EmptyCacheFailure(message: e.message));
           }
         }


  }

  @override
  Future<Either<Failure, Unit>> addPost({required PostEntity postEntity}) async {
    return specificRefactoredFunction(()
    {
     return postsRemoteDataSource.addPost(
          postsModel:
          PostsModel(
              title: postEntity.title,
              body: postEntity.body));
    },);

  }

  @override
  Future<Either<Failure, Unit>> deletePost({required num postId}) async {
    return specificRefactoredFunction(()
    {
      return postsRemoteDataSource.deletePost(
      postId: postId);
    },);
  }

  @override
  Future<Either<Failure, Unit>> updatePost({required PostEntity postEntity}) async {
    return specificRefactoredFunction(()
    {
      return postsRemoteDataSource.updatePost(
          postsModel:
          PostsModel(
              userId: Random().nextInt(1000),
              postId: postEntity.postId,
              title: postEntity.title, body: postEntity.body));
    },);
  }

  Future<Either<Failure, Unit>> specificRefactoredFunction(ForAllSendingData specificFun) async
  {
    bool internetConnected = await InternetConnectionService().checkConnection();
    if(internetConnected)
    {
      try
      {
        await specificFun();
        return Right(unit);
      } on ServerException catch (e)
      {
        return Left(ServerFailure(message: e.message));
      }
    }
    else
    {
      return Left(NetworkFailure(message: 'Network failure'));
    }

  }



}