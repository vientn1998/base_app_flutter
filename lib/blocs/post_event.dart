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
  // TODO: implement props
  List<Object> get props => [this.postId];
}

