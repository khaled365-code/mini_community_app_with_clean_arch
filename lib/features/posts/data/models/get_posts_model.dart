


import 'package:clean_architecture_idea_app/core/services/api/api_constants.dart';
import 'package:equatable/equatable.dart';

class PostsModel extends Equatable
{

  final num? userId;
  final num? postId;
  final String title;
  final String body;


  const PostsModel({this.userId,
    this.postId, required this.title,
    required this.body});


  factory PostsModel.fromJson(Map<String,dynamic> json)
  {
    return PostsModel(
        userId: json[ApiKeys.userId],
        postId: json[ApiKeys.id],
        title: json[ApiKeys.title],
        body: json[ApiKeys.body]);

  }



  Map<String,dynamic> toJson()=> {
    ApiKeys.userId : userId,
    ApiKeys.id : postId,
    ApiKeys.title : title,
    ApiKeys.body : body,
  };



  @override
  List<Object?> get props => [userId,postId,title,body];


}