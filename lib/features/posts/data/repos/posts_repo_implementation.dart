


import 'dart:convert';

import 'package:clean_architecture_idea_app/core/errors/exceptions.dart';
import 'package:clean_architecture_idea_app/core/errors/failure.dart';
import 'package:clean_architecture_idea_app/core/services/api/api_consumer.dart';
import 'package:clean_architecture_idea_app/core/services/api/end_points.dart';
import 'package:clean_architecture_idea_app/core/services/internet_connection_checker.dart';
import 'package:clean_architecture_idea_app/features/posts/data/mappers/post_model_to_domain.dart';
import 'package:clean_architecture_idea_app/features/posts/data/models/get_posts_model.dart';
import 'package:clean_architecture_idea_app/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecture_idea_app/features/posts/domain/repos/posts_repo.dart';
import 'package:dartz/dartz.dart';

class PostsRepoImplementation implements PostsRepo
{

  final ApiConsumer apiConsumer;
  const PostsRepoImplementation({required this.apiConsumer});

  @override
  Future<Either<Failure,List<PostEntity>>> getPosts() async
  {
    try
     {
       bool internetConnected = await InternetConnectionService().checkConnection();
       if(internetConnected)
         {
            final response=await apiConsumer.get(EndPoints.getPosts);
            List<PostsModel> postsModelList=
            List.from(jsonDecode(response).map((item)=>PostsModel.fromJson(item)).toList());
            List<PostEntity> postEntityList =
            List.from(postsModelList.map((item)=>PostModelToDomainMapper.convertPostModelToEntity(item)).toList());
            return Right(postEntityList);
         }
       else
         {
           // get from local
         }

     } on ServerException catch (e)
      {
        return Left(ServerFailure(message: e.message));

      } on NetworkException catch(e)
      {
         return Left(NetworkFailure(message: e.message));
      }
       on EmptyCacheException catch (e)
       {
         return Left(EmptyCacheFailure(message: e.message));
       }
  }

  @override
  Future<Either<Failure, Unit>> addPost({required PostEntity postEntity}) async {
    // TODO: implement addPost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deletePost({required num postId}) async {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> updatePost({required PostEntity postEntity}) async {
    // TODO: implement updatePost
    throw UnimplementedError();
  }






}