

import 'package:clean_architecture_idea_app/core/errors/failure.dart';
import 'package:clean_architecture_idea_app/features/posts/domain/repos/posts_repo.dart';
import 'package:dartz/dartz.dart';

class DeletePostUseCase
{
  final PostsRepo postsRepo;

  const DeletePostUseCase({required this.postsRepo});


  Future<Either<Failure,Unit>> call({required num postId}) async
  {
    return await postsRepo.deletePost(postId: postId);
  }



}