


import 'package:clean_architecture_idea_app/core/errors/failure.dart';
import 'package:clean_architecture_idea_app/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecture_idea_app/features/posts/domain/repos/posts_repo.dart';
import 'package:dartz/dartz.dart';

class PostsRepoImplementation implements PostsRepo
{
  @override
  Future<Either<Failure,List<PostEntity>>> getPosts() async {
    // TODO: implement getPosts
    throw UnimplementedError();
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