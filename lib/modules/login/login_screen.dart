import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pose_detection/layouts/app_layout.dart';
import 'package:pose_detection/modules/home_screen.dart';
import 'package:pose_detection/modules/register/register_screen.dart';
import 'package:pose_detection/shared/components/components.dart';
import 'package:pose_detection/shared/cubit/home_cubit.dart';
import 'package:pose_detection/shared/cubit/home_states.dart';
import 'package:pose_detection/shared/network/local/cash_helper.dart';
import 'package:pose_detection/shared/style/colors.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    this.cashedEmail,
    this.cashedPassword,
  });

  String? cashedEmail;
  String? cashedPassword;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    if (widget.cashedEmail != null) {
      HomeCubit.get(context).emailController.text = widget.cashedEmail!;
    }

    if (widget.cashedPassword != null) {
      passwordController.text = widget.cashedPassword!;
    }
  }

  // GoogleSignIn _googleSignIn = GoogleSignIn(
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          // ignore: unnecessary_null_comparison
          if (state.token != null) {
            showToast(
                text: "you are logged successfully", background: Colors.green);
            CashHelper.saveData(key: "token", value: state.token).then((value) {
              navigateAndFinish(context: context, widget: AppLayout());
            });
          } else {
            Fluttertoast.showToast(
                msg: "this account is not exist ",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        } else if (state is LoginErrorState) {
          Fluttertoast.showToast(
              msg: "this account is not exist ",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        return SafeArea(
          top: true,
          child: Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 426,
                      height: 230,
                      child: const Image(
                        image: AssetImage(
                          "assets/images/ver 2.png",

                        ),
                        color: Colors.white,
                        //fit: BoxFit.contain,
                      ),
                      decoration: BoxDecoration(
                        color: HexColor("#011936"),
                        borderRadius: const BorderRadiusDirectional.only(
                            bottomStart: Radius.circular(50),
                            bottomEnd: Radius.circular(50)),
                        //image: AssetImage(""),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          defaultFormField(
                            controller: HomeCubit.get(context).emailController,
                            type: TextInputType.emailAddress,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "email must not be empty";
                              }
                              return null;
                            },
                            //hint: "Email",
                            prefix: Icons.email_outlined,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Password",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          defaultFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return "password must not be empty";
                              }
                              return null;
                            },
                            //hint: "Password",
                            prefix: Icons.lock,
                            suffix: HomeCubit.get(context).suffix,
                            isPassword: HomeCubit.get(context).isPassword,
                            suffixPressed: () {
                              HomeCubit.get(context).changePasswordVisibility();
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: HomeCubit.get(context).textBoxSelected,
                                activeColor: HexColor("#011936"),
                                onChanged: (value) {
                                  HomeCubit.get(context).changeTextBoxColor();
                                },
                              ),
                              const Text("Remember me"),
                              const Spacer(),
                              const Text("Forgot Password?"),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            builder: (context) => defaultButton(
                              background: HexColor("#011936"),
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  if (HomeCubit.get(context).textBoxSelected) {
                                    CashHelper.saveData(
                                            key: "email",
                                            value: HomeCubit.get(context)
                                                .emailController
                                                .text)
                                        .then((value) {
                                      CashHelper.saveData(
                                              key: "password",
                                              value: passwordController.text)
                                          .then((value) {
                                        HomeCubit.get(context).userLogin(
                                            email: HomeCubit.get(context)
                                                .emailController
                                                .text,
                                            password: passwordController.text);
                                      });
                                    });
                                  } else {
                                    CashHelper.removeData(
                                      key: "email",
                                    ).then((value) {
                                      CashHelper.removeData(
                                        key: "password",
                                      ).then((value) {
                                        print('login without remember');
                                        HomeCubit.get(context).userLogin(
                                            email: HomeCubit.get(context)
                                                .emailController
                                                .text,
                                            password: passwordController.text);
                                      });
                                    });
                                  }

                                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                                }
                              },
                              text: "LOGIN",
                            ),
                            fallback: (context) =>
                                const Center(child: CircularProgressIndicator()),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Stack(
                            alignment: AlignmentDirectional.center,
                            children: <Widget>[
                              myDivider(),
                              SvgPicture.asset(
                                "assets/images/or.svg",
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Align(
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              "Sign in with",
                              style: TextStyle(fontSize: 17.0),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                elevation: 10,
                                child: SizedBox(
                                  width: 50,
                                  height: 40,
                                  child: IconButton(
                                    onPressed: () {
                                      // HomeCubit.get(context).googleSignIn();
                                    },
                                    icon: Image.asset(
                                      "assets/images/google.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                elevation: 10,
                                child: SizedBox(
                                  width: 50,
                                  height: 40,
                                  child: SvgPicture.asset(
                                    "assets/images/Facebook.svg",
                                    color: Colors.indigo,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // Card(
                              //   clipBehavior: Clip.antiAliasWithSaveLayer,
                              //   shape: RoundedRectangleBorder(
                              //       borderRadius: BorderRadius.circular(10.0)),
                              //   elevation: 10,
                              //   child: SizedBox(
                              //     width: 50,
                              //     height: 40,
                              //     child: IconButton(
                              //       onPressed: () {},
                              //       icon: SvgPicture.asset(
                              //           "assets/images/Twitter.svg",
                              //           color: Colors.blue,
                              //           fit: BoxFit.cover),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account? ",
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen()));
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: primary,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
