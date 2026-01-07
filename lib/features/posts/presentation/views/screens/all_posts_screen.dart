import 'package:clean_architecture_idea_app/core/common/enums.dart';
import 'package:clean_architecture_idea_app/core/utils/app_colors.dart';
import 'package:clean_architecture_idea_app/core/widgets/shared_app_bar.dart';
import 'package:clean_architecture_idea_app/features/posts/presentation/manager/get_posts_bloc/get_all_posts_bloc.dart';
import 'package:clean_architecture_idea_app/features/posts/presentation/views/widgets/posts_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllPostsScreen extends StatelessWidget {
  const AllPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<GetAllPostsBloc, GetAllPostsState>(
        listener: (context, state) {
          if (state.internetIsConnected==false)
            {
              ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
               showCloseIcon: true,
               backgroundColor: AppColors.c152256,
               content: Row(children:
               [
                    Icon(Icons.wifi_off,),
                    const SizedBox(width: 10,),
                    Text('No internet connection')
               ],))
              );
            }
        },
        child: SafeArea(
          child: CustomScrollView(
            slivers:
            [
              SliverToBoxAdapter(
                  child: SharedAppBar(title: 'Posts',)
              ),
              SliverToBoxAdapter(child: const SizedBox(height: 10,)),
              BlocBuilder<GetAllPostsBloc, GetAllPostsState>(
                buildWhen: (prev, current) =>
                prev.getAllPostsRequestState != current.getAllPostsRequestState,
                builder: (context, state) {
                  return state.getAllPostsRequestState == RequestStates.success
                      && state.postEntityList!.isNotEmpty ?
                  PostsListView(postEntityList: state.postEntityList!) :
                  state.getAllPostsRequestState == RequestStates.success &&
                      state.postEntityList!.isEmpty ?
                  SliverFillRemaining(
                      child: Column(
                        children:
                        [
                          Spacer(),
                          Text('No posts Availiable now'),
                          Spacer(),
                        ],
                      )) :
                  state.getAllPostsRequestState == RequestStates.failure ?
                  SliverFillRemaining(
                      child: Column(
                        children:
                        [
                          Spacer(),
                          Text(state.getPostsFailureM),
                          Spacer(),
                        ],
                      )) :
                  SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()));
                },
              )


            ],
          ),
        ),
      ),

    );
  }
}
