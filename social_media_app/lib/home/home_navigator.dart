import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/comments/comments_view.dart';
import 'package:social_media_app/home/home_navigator_cubit.dart';
import 'package:social_media_app/home/home_view.dart';
import 'package:social_media_app/profile/profile_view.dart';

class HomeNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeNavigatorCubit(),
      child: BlocBuilder<HomeNavigatorCubit, HomeNavigatorState>(
          builder: (context, state) {
        return Navigator(
          pages: [
            MaterialPage(child: (HomeView())),
            if (state == HomeNavigatorState.profile)
              MaterialPage(child: ProfileView()),
            if (state == HomeNavigatorState.comments)
              MaterialPage(child: CommentsView())
          ],
          onPopPage: (route, result) {
            context.read<HomeNavigatorCubit>().showHome();
            return route.didPop(result);
          },
        );
      }),
    );
  }
}
