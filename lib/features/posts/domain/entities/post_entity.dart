


import 'package:clean_architecture_idea_app/core/errors/failure.dart';
import 'package:clean_architecture_idea_app/features/posts/domain/repos/posts_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class PostEntity extends Equatable
{

  final num postId;
  final String title,body;

  const PostEntity({required this.postId,required this.title,required this.body});

  @override
  List<Object?> get props => [postId,title,body];


}


