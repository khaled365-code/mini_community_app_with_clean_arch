



import 'package:clean_architecture_idea_app/core/utils/app_colors.dart';
import 'package:clean_architecture_idea_app/features/posts/domain/entities/post_entity.dart';
import 'package:flutter/cupertino.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key,required this.postEntity});

  final PostEntity postEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
      ),
      padding: EdgeInsetsDirectional.symmetric(vertical: 10,horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Text(postEntity.postId.toString()),
          const SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Text(postEntity.title),
                const SizedBox(height: 5,),
                Text(postEntity.body),
              ],
            ),
          )
        ],
      ),
    );
  }
}
