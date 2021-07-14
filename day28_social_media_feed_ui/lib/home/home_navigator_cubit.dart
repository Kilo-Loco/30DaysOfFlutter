import 'package:flutter_bloc/flutter_bloc.dart';

enum HomeNavigatorState { home, profile, comments }

class HomeNavigatorCubit extends Cubit<HomeNavigatorState> {
  HomeNavigatorCubit() : super(HomeNavigatorState.home);

  void showProfile() => emit(HomeNavigatorState.profile);
  void showComments() => emit(HomeNavigatorState.comments);
  void showHome() => emit(HomeNavigatorState.home);
}
