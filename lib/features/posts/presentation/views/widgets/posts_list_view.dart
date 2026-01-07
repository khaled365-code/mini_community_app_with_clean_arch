


import 'package:clean_architecture_idea_app/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecture_idea_app/features/posts/presentation/views/widgets/post_item.dart';
import 'package:flutter/material.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({super.key,required this.postEntityList});
  final List<PostEntity> postEntityList;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
    itemBuilder: (context,index)=> index==postEntityList.length-1?
        Padding(padding: EdgeInsetsDirectional.only(bottom: 10),child: PostItem(postEntity: postEntityList[index]),):
        PostItem(postEntity: postEntityList[index]),
    separatorBuilder: (context, index) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Divider(),
    ),
    itemCount: postEntityList.length);
  }
}
