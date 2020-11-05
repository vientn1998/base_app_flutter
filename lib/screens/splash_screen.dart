import 'package:base_app_flutter/blocs/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo"),
      ),
      body: Center(
        child: BlocConsumer<PostBloc, PostState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            if (state is FetchPostError) {
              return Text("Error: ${state.message}");
            } else if (state is FetchPostSuccessfully) {
              return Text("Data: ${state.listPost[0].toJson()}");
            } else if (state is FetchDetailsPostError) {
              return Text("Error: ${state.message}");
            } else if (state is FetchDetailsPostSuccessfully) {
              return Text("Data: ${state.post.toJson()}");
            }
            return Text("Loading");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // BlocProvider.of<PostBloc>(context).add(FetchPosts());
          BlocProvider.of<PostBloc>(context).add(FetchDetailsPost(postId: 2));
        },

        tooltip: 'Fetch',
        child: Icon(Icons.add),
      ),
    );
  }
}
