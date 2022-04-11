import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pose_detection/models/login_model.dart';
import 'package:pose_detection/models/register_model.dart';
import 'package:pose_detection/modules/favorite_screen.dart';
import 'package:pose_detection/modules/home_screen.dart';
import 'package:pose_detection/modules/myCartScreen.dart';
import 'package:pose_detection/modules/user_screen.dart';
import 'package:pose_detection/shared/components/constants.dart';
import 'package:pose_detection/shared/cubit/home_states.dart';
import 'package:pose_detection/shared/network/endPoints.dart';
import 'package:pose_detection/shared/network/remote/dio_helper.dart';
import 'package:pose_detection/shared/style/colors.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  RegisterModel? registerModel;
  LoginModel? loginModel;

  void userRegister({
    required String name,
    required String email,
    required String password,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: register,
      data: {"username": name, "email": email, "password": password},
    ).then((value) {
      print(value.data);
      print('userRegister ----------------- success dio');
      registerModel = RegisterModel.fromJson(value.data);
      print('userLogin ----------------- success parse');
      print('login token ${registerModel!.token}');
      print(registerModel!.user!.email);
      currentIndex = 0;
      emit(RegisterSuccessState(registerModel!.token!));
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
      print('registerLogin -------------- error');
      print(error.toString());
    });
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: login,
      data: {"username": email, "password": password},
    ).then((value) {
      print(value.data);
      print('userLogin ----------------- success dio');
      loginModel = LoginModel.fromJson(value.data);
      print('userLogin ----------------- success parse');
      print('login token ${loginModel!.token}');
      currentIndex = 0;
      emit(LoginSuccessState(loginModel!.token!));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
      print('userLogin -------------- error');
      print(error.toString());
    });
  }

  User? userModel;

  void getUser() {
    emit(GetUserLoadingState());
    DioHelper.getData(
      url: 'user',
      token: token,
    ).then((value) {
      print(value.data);
      print('userLogin ----------------- success dio');
      userModel = User.fromJson(value.data);
      print('userLogin ----------------- success parse');
      print('login token ${userModel!.id}');
      emit(GetUserSuccessState());
    }).catchError((error) {
      emit(GetUserErrorState());
      print('userLogin -------------- error');
      print(error.toString());
    });
  }

  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    FavouriteScreen(),
    CartScreen(),
    UserScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNav());
  }

  void getHome() {
    emit(GetHomeLoadingState());
    // DioHelper.getData(url: "v2/top-headlines",query: {
    //   "country":"eg",
    //   "category":"business",
    //   "apiKey":"65f7f556ec76449fa7dc7c0069f040ca"
    // }).then((value){
    //   business=value.data["articles"];
    //   print(business[0]["title"]);
    //   emit(NewsGetHomeSuccessState());
    // }).catchError((error){
    //   print(error.toString());
    //   emit(NewsGetHomeErrorState());
    // });
  }

  void getFavourite() {
    emit(GetFavoriteLoadingState());
    // if(sports.length==0){
    //   DioHelper.getData(url: "v2/top-headlines",query: {
    //     "country":"eg",
    //     "category":"sports",
    //     "apiKey":"65f7f556ec76449fa7dc7c0069f040ca"
    //   }).then((value){
    //     sports=value.data["articles"];
    //     print(sports[0]["title"]);
    //     emit(GetFavoriteSuccessState());
    //   }).catchError((error){
    //     print(error.toString());
    //     emit(GetFavoriteErrorState());
    //   });
    // }else{
    //   emit(GetFavoriteSuccessState());
    // }
  }

  void getCart() {
    emit(GetCartLoadingState());
    // if (science.length == 0) {
    //   DioHelper.getData(url: "v2/top-headlines", query: {
    //     "country": "eg",
    //     "category": "science",
    //     "apiKey": "65f7f556ec76449fa7dc7c0069f040ca"
    //   }).then((value) {
    //     science = value.data["articles"];
    //     print(science[0]["title"]);
    //     emit(GetCartSuccessState());
    //   }).catchError((error) {
    //     print(error.toString());
    //     emit(GetCartErrorState());
    //   });
    // }else{
    //   emit(GetCartErrorState());
    // }
  }

  // void getUser() {
  //   emit(GetUserLoadingState());
  //   // if (science.length == 0) {
  //   //   DioHelper.getData(url: "v2/top-headlines", query: {
  //   //     "country": "eg",
  //   //     "category": "science",
  //   //     "apiKey": "65f7f556ec76449fa7dc7c0069f040ca"
  //   //   }).then((value) {
  //   //     science = value.data["articles"];
  //   //     print(science[0]["title"]);
  //   //     emit(GetUserSuccessState());
  //   //   }).catchError((error) {
  //   //     print(error.toString());
  //   //     emit(GetUserErrorState());
  //   //   });
  //   // }else{
  //   //   emit(GetUserErrorState());
  //   // }
  // }

  bool isSelected = true;
  Color color = Colors.grey;

  void changeColor() {
    isSelected = !isSelected;
    color = isSelected ? primary : Colors.grey;
    emit(HeartColorState());
  }

  bool textBoxSelected = true;
  Color textBoxColor = Colors.grey;

  void changeTextBoxColor() {
    textBoxSelected = !textBoxSelected;
    textBoxColor = textBoxSelected ? primary : Colors.grey;
    emit(TextBoxColorState());
  }

  Color containerColor = Colors.grey.withOpacity(0.5);

  int selectedPaymentIndex = 0;

  void changeContainerColor({required int index}) {
    selectedPaymentIndex = index;
    emit(ContainerColorState());
  }

  int selectedIndex = 0;

  void changeSelectedText({required int index}) {
    selectedIndex = index;
    emit(ChangeSelectedTextState());
  }

  int selectedSizeIndex = 0;

  void changeSelectedSizeText({required int index}) {
    selectedSizeIndex = index;
    emit(ChangeSelectedSizeTextState());
  }

  int selectedShirtColorIndex = 0;

  void changeSelectedShirtColorText({required int index}) {
    selectedShirtColorIndex = index;
    emit(ChangeSelectedShirtColorTextState());
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(ChangePasswordVisibilityState());
  }

  int counter = 1;

  void minus() {
    counter--;
    emit(CounterMinusState(counter));
  }

  void plus() {
    counter++;
    emit(CounterPlusState(counter));
  }

  /// pick photo ------------ start
  final ImagePicker _picker = ImagePicker();
  File? imageFile;

  void selectImage(context) async {
    _picker.pickImage(source: ImageSource.gallery).then((value) {
      imageFile = File(value!.path);
      emit(PickImageSuccessState());
    });
    Navigator.pop(context);
  }

  void selectCamera(context) async {
    _picker.pickImage(source: ImageSource.camera,).then((value) {
      imageFile = File(value!.path);
      emit(PickImageSuccessState());
    });

    Navigator.pop(context);
  }

  void clearSelectedImage() {
    imageFile = null;
    emit(ClearImageSuccessState());
  }

// pick photo ------------ end

  /// todo google auth
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  String? emailByGoogle;
  var emailController = TextEditingController();

  Future<void> googleSignIn() async {
    emit(GoogleLoadingState());
    await _googleSignIn.signIn().then((value) {
      emailByGoogle = value!.email;
      if (emailByGoogle != null) {
        emailController.text = emailByGoogle!;
      }
      emit(GoogleSuccessState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(GoogleErrorState());

    });
  }

  String? registerEmailByGoogle;
  String? registerFirstName;
  String? registerLastName;
  var registerEmailController = TextEditingController();

  var firstNameController = TextEditingController();

  var lastNameController = TextEditingController();

  Future<void> googleSignUp() async {
    emit(GoogleLoadingState());
    await _googleSignIn.signIn().then((value) {
      registerEmailByGoogle = value!.email;
      if (value.displayName != null) {
        if (value.displayName!.contains(' ')) {
          registerFirstName = value.displayName!.split(' ').first;
          firstNameController.text = registerFirstName!;
          registerLastName = value.displayName!.split(' ').last;
          lastNameController.text = registerLastName!;
        } else {
          registerFirstName = value.displayName;
          firstNameController.text = registerFirstName!;
        }
      }
      if (registerEmailByGoogle != null) {
        registerEmailController.text = registerEmailByGoogle!;
      }
      emit(GoogleSuccessState());
    }).catchError((error) {
      emit(GoogleErrorState());
    });
  }
}
