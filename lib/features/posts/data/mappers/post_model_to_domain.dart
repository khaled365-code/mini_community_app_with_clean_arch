


import 'package:clean_architecture_idea_app/features/posts/data/models/get_posts_model.dart';
import 'package:clean_architecture_idea_app/features/posts/domain/entities/post_entity.dart';

class PostModelToDomainMapper
{

  static PostEntity convertPostModelToEntity(PostsModel postsModel)
  {
    return PostEntity(
    postId: postsModel.postId??0,
    title: postsModel.title,
    body: postsModel.body);

  }


}