import 'package:bloc/bloc.dart';
import 'package:bloc2/bloc/counter/counter_event.dart';
import 'package:bloc2/bloc/counter/counter_state.dart';
import 'package:bloc2/bloc/post/post_event.dart';
import 'package:bloc2/bloc/post/post_state.dart';
import 'package:bloc2/model/post_model.dart';
import 'package:bloc2/repository/post_repository.dart';
import 'package:bloc2/utils/post_status.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc()
      : super(PostState(
            posts: [], errorMessage: "", status: PostStatus.loading)) {
    on<GetAllPostEvent>(loadData);
  }

  void loadData(GetAllPostEvent event, Emitter<PostState> emit) async {
    // call api

    PostRepository postRepository = PostRepository();

    emit(state.copyWith(status: PostStatus.loading));

    await postRepository
        .getPostsApi()
        .then((List<PostModel> value) => {
              emit(state.copyWith(
                  posts: value, errorMessage: '', status: PostStatus.success))
            })
        .catchError((error, StackTrace) {
      emit(state.copyWith(
          posts: [], errorMessage: '${error}', status: PostStatus.failed));
    });
  }
}
