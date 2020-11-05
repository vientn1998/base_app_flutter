part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
  @override
  List<Object> get props => [];
}

class FetchPosts extends PostEvent {}

class FetchDetailsPost extends PostEvent {
  int postId;
  FetchDetailsPost({this.postId});
  @override
  List<Object> get props => [this.postId];
}


class CreatePost extends PostEvent {
  Post post;
  CreatePost({this.post});
  @override
  List<Object> get props => [this.post];
}
