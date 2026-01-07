part of 'get_all_posts_bloc.dart';

@immutable
final class GetAllPostsState  extends Equatable
{


  final RequestStates getAllPostsRequestState;
  final String getPostsFailureM;
  final List<PostEntity>? postEntityList;
  final bool internetIsConnected;




  const GetAllPostsState({
    this.getAllPostsRequestState=RequestStates.initial,
    this.getPostsFailureM='',this.postEntityList,this.internetIsConnected=true});


  GetAllPostsState copyWith({RequestStates? getAllPostsRequestState, String? getPostsFailureM,
  List<PostEntity>? postEntityList,bool? internetIsConnected
  })
  {
    return GetAllPostsState(
      getAllPostsRequestState: getAllPostsRequestState??this.getAllPostsRequestState,
      getPostsFailureM: getPostsFailureM??this.getPostsFailureM,
      postEntityList: postEntityList??this.postEntityList,
      internetIsConnected: internetIsConnected??this.internetIsConnected
    );

  }





  @override
  List<Object?> get props => [getAllPostsRequestState,getPostsFailureM,postEntityList,internetIsConnected];




}

