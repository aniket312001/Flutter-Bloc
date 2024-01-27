import 'package:bloc2/model/post_model.dart';
import 'package:bloc2/utils/post_status.dart';
import 'package:equatable/equatable.dart';

class PostState extends Equatable {
  final List<PostModel> posts;
  final PostStatus status;
  final String errorMessage;

  PostState(
      {this.posts = const [],
      this.status = PostStatus.loading,
      this.errorMessage = ''});

  @override
  // TODO: implement props
  List<Object?> get props => [posts, status, errorMessage];

  PostState copyWith(
      {List<PostModel>? posts, String? errorMessage, PostStatus? status}) {
    return PostState(
        posts: posts ?? this.posts,
        errorMessage: errorMessage ?? this.errorMessage,
        status: status ?? this.status);
  }
}

class getAllPostState extends PostState {}

// class decrementEvent extends PostState {}
