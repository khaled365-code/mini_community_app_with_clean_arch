import 'package:bloc/bloc.dart';
import 'package:clean_architecture_idea_app/core/common/enums.dart';
import 'package:clean_architecture_idea_app/core/services/internet_connection_checker.dart';
import 'package:clean_architecture_idea_app/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecture_idea_app/features/posts/domain/use_cases/get_posts_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'get_all_posts_event.dart';
part 'get_all_posts_state.dart';

class GetAllPostsBloc extends Bloc<GetAllPostsEvent, GetAllPostsState> {

  final GetPostsUseCase getPostsUseCase;
  GetAllPostsBloc({required this.getPostsUseCase}) : super(GetAllPostsState()) {
    on<GetAllPostsEvent>((event, emit) async
    {
        if(await InternetConnectionService().checkConnection()==false)
          {
           emit(state.copyWith(internetIsConnected: false));
          }
          emit(state.copyWith(getAllPostsRequestState: RequestStates.loading));
          final result=await getPostsUseCase();
          result.fold((failure)=>emit(state.copyWith(getPostsFailureM: failure.message,getAllPostsRequestState: RequestStates.failure)),
          (postEntityList)=>emit(state.copyWith(postEntityList: postEntityList,getAllPostsRequestState: RequestStates.success)));

    });
  }
}
