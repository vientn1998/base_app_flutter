part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();
  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class FetchPostLoading extends PostState {}
class FetchPostSuccessfully extends PostState {
  final List<Post> listPost;
  FetchPostSuccessfully({this.listPost});
  @override
  List<Object> get props => [this.listPost];
}
class FetchPostError extends PostState {
  String message;
  FetchPostError({this.message});
  @override
  List<Object> get props => [this.message];
}

class FetchDetailsPostLoading extends PostState {}
class FetchDetailsPostSuccessfully extends PostState {
  final Post post;
  FetchDetailsPostSuccessfully({this.post});
  @override
  List<Object> get props => [this.post];
}
class FetchDetailsPostError extends PostState {
  String message;
  FetchDetailsPostError({this.message});
  @override
  List<Object> get props => [this.message];
}

class CreatePostLoading extends PostState {}
class CreatePostSuccessfully extends PostState {
  final Post post;
  CreatePostSuccessfully({this.post});
  @override
  List<Object> get props => [this.post];
}
class CreatePostError extends PostState {
  String message;
  CreatePostError({this.message});
  @override
  List<Object> get props => [this.message];
}