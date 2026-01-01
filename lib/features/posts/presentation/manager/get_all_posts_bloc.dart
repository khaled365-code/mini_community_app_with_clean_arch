import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'get_all_posts_event.dart';
part 'get_all_posts_state.dart';

class GetAllPostsBloc extends Bloc<GetAllPostsEvent, GetAllPostsState> {
  GetAllPostsBloc() : super(GetAllPostsState()) {
    on<GetAllPostsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
