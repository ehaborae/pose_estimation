import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pose_detection/shared/cubit/home_cubit.dart';
import 'package:pose_detection/shared/cubit/home_states.dart';
import 'package:pose_detection/shared/style/colors.dart';

class AppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: primary,
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            currentIndex: cubit.currentIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_rounded), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            ],
          ),
        );
      },
    );
  }
}
