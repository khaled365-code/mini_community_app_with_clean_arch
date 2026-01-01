


import 'package:equatable/equatable.dart';

class PostEntity extends Equatable
{

  final num postId;
  final String title,body;

  const PostEntity({required this.postId,required this.title,required this.body});

  @override
  List<Object?> get props => [postId,title,body];


}