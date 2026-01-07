

import 'package:clean_architecture_idea_app/core/errors/failure.dart';
import 'package:clean_architecture_idea_app/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecture_idea_app/features/posts/domain/repos/posts_repo.dart';
import 'package:dartz/dartz.dart';

class UpdatePostUseCase
{

  final PostsRepo postsRepo;
  const UpdatePostUseCase({required this.postsRepo});

  Future<Either<Failure,Unit>> call({required PostEntity postEntity}) async
  {
    return await postsRepo.updatePost(postEntity: postEntity,);
  }





}