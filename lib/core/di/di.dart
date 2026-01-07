


import 'package:clean_architecture_idea_app/core/services/api/api_consumer.dart';
import 'package:clean_architecture_idea_app/core/services/api/http_consumer.dart';
import 'package:clean_architecture_idea_app/features/posts/data/data_source/posts_local_data_source.dart';
import 'package:clean_architecture_idea_app/features/posts/data/data_source/posts_remote_data_source.dart';
import 'package:clean_architecture_idea_app/features/posts/data/repos/posts_repo_implementation.dart';
import 'package:clean_architecture_idea_app/features/posts/domain/repos/posts_repo.dart';
import 'package:clean_architecture_idea_app/features/posts/domain/use_cases/get_posts_usecase.dart';
import 'package:get_it/get_it.dart';

GetIt locator=GetIt.instance;

void setupDi()
{
    locator.registerLazySingleton<ApiConsumer>(()=>HttpConsumer());
    locator.registerLazySingleton<PostsRemoteDataSource>(() => PostsRemoteDataSourceImplWithHttp(apiConsumer: locator.get<ApiConsumer>()),);
    locator.registerLazySingleton<PostsLocalDataSource>(() => PostsLocalDataSourceWithSharedPref(),);
    locator.registerLazySingleton<PostsRepo>(()=> PostsRepoImplementation(
        postsRemoteDataSource: locator.get<PostsRemoteDataSource>(),
        postsLocalDataSource: locator.get<PostsLocalDataSource>()),);

    locator.registerLazySingleton(()=>GetPostsUseCase(postsRepo: locator.get<PostsRepo>()));


}