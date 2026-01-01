

import 'package:clean_architecture_idea_app/core/errors/failure.dart';
import 'package:clean_architecture_idea_app/features/posts/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostsRepo
{

  Future<Either<Failure,List<PostEntity>>> getPosts();

  Future<Either<Failure,Unit>> addPost({required PostEntity postEntity});

  Future<Either<Failure,Unit>> deletePost({required num postId});


  Future<Either<Failure,Unit>> updatePost({required PostEntity postEntity});



}