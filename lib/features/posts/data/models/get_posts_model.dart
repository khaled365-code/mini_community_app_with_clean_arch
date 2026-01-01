


import 'package:clean_architecture_idea_app/core/common/api_constants.dart';
import 'package:equatable/equatable.dart';

class GetPostsModel extends Equatable
{

  final num userId;
  final num postId;
  final String title;
  final String body;


  const GetPostsModel({required this.userId,
    required this.postId, required this.title,
    required this.body});


  factory GetPostsModel.fromJson(Map<String,dynamic> json)
  {
    return GetPostsModel(
        userId: json[ApiConstants.userId],
        postId: json[ApiConstants.id],
        title: json[ApiConstants.title],
        body: json[ApiConstants.body]);

  }



  Map<String,dynamic> toJson()=> {
    ApiConstants.userId : userId,
    ApiConstants.id : postId,
    ApiConstants.title : title,
    ApiConstants.body : body,
  };



  @override
  List<Object?> get props => [userId,postId,title,body];


}