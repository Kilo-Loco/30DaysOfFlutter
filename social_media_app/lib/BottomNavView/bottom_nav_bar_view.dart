import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/BottomNavView/bottom_nav_bar_cubit.dart';
import 'package:social_media_app/home/home_navigator.dart';
import 'package:social_media_app/home/home_view.dart';
import 'package:social_media_app/profile/profile_view.dart';

class BottomNavBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: BlocBuilder<BottomNavBarCubit, int>(builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state,
            children: [
              HomeNavigator(),
              ProfileView(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state,
            onTap: (index) =>
                context.read<BottomNavBarCubit>().selectTab(index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
        );
      }),
    );
  }
}
