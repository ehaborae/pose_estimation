import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pose_detection/shared/block_observer.dart';
import 'package:pose_detection/shared/cubit/home_cubit.dart';
import 'package:pose_detection/shared/cubit/home_states.dart';
import 'package:pose_detection/shared/network/local/cash_helper.dart';
import 'package:pose_detection/shared/network/remote/dio_helper.dart';

import 'modules/splash_screen.dart';
import 'pages/home/home_page.dart';
import 'services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await CashHelper.init();
  DioHelper.init();
  // await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => HomeCubit(),
//       child: BlocConsumer<HomeCubit, HomeStates>(
//         builder: (context, state) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             home: HomePage(),
//           );
//         },
//         listener: (context, state) {},
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => BlocProvider(
        create: (BuildContext context) => HomeCubit(),
        child: BlocConsumer<HomeCubit, HomeStates>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: MySplashScreen(),
            );
          },
          listener: (context, state) {},
        ),
      ),
    );
  }
}
