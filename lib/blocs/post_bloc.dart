import 'dart:async';

import 'package:base_app_flutter/data/network/api_exceptions.dart';
import 'package:base_app_flutter/data/repository.dart';
import 'package:base_app_flutter/models/post.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {

  Repository repository;

  PostBloc({this.repository});

  @override
  PostState get initialState => PostInitial();

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    if (event is FetchPosts) {
      yield* _mapFetchPostToState(event);
    } else if (event is FetchDetailsPost) {
      yield* _mapFetchPostDetailsToState(event);
    } else if (event is CreatePost) {
      yield* _mapCreatePostToState(event);
    }
  }

  Stream<PostState> _mapCreatePostToState(CreatePost event) async*{
    yield CreatePostLoading();
    try {
      final Post post = await repository.createPost(event.post);
      print("post: ${post.toJson()}");
      yield FetchDetailsPostSuccessfully(post: post);
    } catch (ex){
      print("_mapCreatePostToState ${ex.toString()}");
      yield CreatePostError(message: ex.toString());
    }
  }

  Stream<PostState> _mapFetchPostDetailsToState(FetchDetailsPost event) async*{
    yield FetchDetailsPostLoading();
    try {
      final Post post = await repository.getPost(event.postId);
      print("postId: ${post.id}");
      yield FetchDetailsPostSuccessfully(post: post);
    } catch (ex){
      print("_mapFetchPostDetailsToState ${ex.toString()}");
      yield FetchDetailsPostError(message: ex.toString());
    }
  }

  Stream<PostState> _mapFetchPostToState(FetchPosts event) async*{
    yield FetchPostLoading();
    try {
      final List<Post> list = await repository.getPosts();
      print("total: ${list.length}");
      yield FetchPostSuccessfully(listPost: list);
    } catch (ex){
      print("_mapFetchPostToState ${ex.toString()}");
      if (ex is NetworkException) {
        yield FetchPostError(message: ex.message);
      } else {
        yield FetchPostError(message: ex);
      }
    }
  }

}

