import 'package:day18_todo_app/auth_cubit.dart';
import 'package:day18_todo_app/auth_state.dart';
import 'package:day18_todo_app/auth_view.dart';
import 'package:day18_todo_app/loading_view.dart';
import 'package:day18_todo_app/todo_cubit.dart';
import 'package:day18_todo_app/todos_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      return Navigator(
        pages: [
          if (state is Unauthenticated) MaterialPage(child: AuthView()),
          if (state is Authenticated)
            MaterialPage(
              child: BlocProvider(
                create: (context) => TodoCubit(userId: state.userId)
                  ..getTodos()
                  ..observeTodo(),
                child: TodosView(),
              ),
            ),
          if (state is UnknownAuthState) MaterialPage(child: LoadingView())
        ],
        onPopPage: (route, result) => route.didPop(result),
      );
    });
  }
}
