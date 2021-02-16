import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_and_cubit/nav_cubit.dart';
import 'package:flutter_bloc_and_cubit/post_details_view.dart';
import 'package:flutter_bloc_and_cubit/posts_view.dart';

import 'post.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Post>(builder: ((context, post) {
      return Navigator(
        pages: [
          MaterialPage(child: PostsView()),
          if (post != null) MaterialPage(child: PostDetailsView(post: post))
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).popToPosts();
          return route.didPop(result);
        },
      );
    }));
  }
}
