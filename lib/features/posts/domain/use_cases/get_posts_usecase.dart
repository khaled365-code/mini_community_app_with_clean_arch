


import 'package:clean_architecture_idea_app/core/errors/failure.dart';
import 'package:clean_architecture_idea_app/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecture_idea_app/features/posts/domain/repos/posts_repo.dart';
import 'package:dartz/dartz.dart';

class GetPostsUseCase
{
  final PostsRepo postsRepo;

  const GetPostsUseCase({required this.postsRepo});

  Future<Either<Failure,List<PostEntity>>> call() async
  {
     return await postsRepo.getPosts();
  }






}