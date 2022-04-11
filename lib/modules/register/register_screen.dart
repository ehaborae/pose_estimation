import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pose_detection/layouts/app_layout.dart';
import 'package:pose_detection/modules/image_picker_screen.dart';
import 'package:pose_detection/modules/login/login_screen.dart';
import 'package:pose_detection/shared/components/components.dart';
import 'package:pose_detection/shared/cubit/home_cubit.dart';
import 'package:pose_detection/shared/cubit/home_states.dart';

import '../home_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          // ignore: unnecessary_null_comparison
          if (state.token != null) {
            showToast(
                text: "you are logged successfully", background: Colors.green);
            //CashHelper.saveData(key: "token", value: state.token).then((value){
            navigateAndFinish(context: context, widget: AppLayout());
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
          showToast(text: state.error, background: Colors.red);
        }
      },
      builder: (context, state) {
        return SafeArea(
          top: true,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: HexColor("#011936"),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
              title: const Text("Sign Up"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Create Your Account",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "First Name",
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      defaultFormField(
                                        controller: HomeCubit.get(context)
                                            .firstNameController,
                                        type: TextInputType.name,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return "name must not be empty";
                                          }
                                          return null;
                                        },
                                        //hint: "First Name",
                                        prefix: Icons.account_box_outlined,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          "Last Name",
                                          style: TextStyle(
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      defaultFormField(
                                        controller: HomeCubit.get(context)
                                            .lastNameController,
                                        type: TextInputType.name,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return "name must not be empty";
                                          }
                                          return null;
                                        },
                                        //hint: "Last Name",
                                        prefix: Icons.account_box_outlined,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Email",
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            defaultFormField(
                              controller: HomeCubit.get(context).registerEmailController,
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
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            defaultFormField(
                              controller: passwordController,
                              isPassword: isObsecure,
                              type: TextInputType.visiblePassword,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return "password must not be empty";
                                }
                                return null;
                              },
                              //hint: "Password",
                              prefix: Icons.lock,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Confirm Password",
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            defaultFormField(
                              isPassword: isObsecure,
                              controller: confirmPasswordController,
                              type: TextInputType.visiblePassword,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return "password must not be empty";
                                }
                                return null;
                              },
                              //hint: "Confirm Password",
                              prefix: Icons.lock,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Phone Number-Optional",
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            defaultFormField(
                              controller: phoneController,
                              type: TextInputType.phone,
                              validate: (value) {
                                if (value!.isEmpty) {}
                                return null;
                              },
                              //hint: "Phone number",
                              prefix: Icons.phone,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: isObsecure ? false : true,
                                  activeColor: HexColor("#011936"),
                                  onChanged: (value) {
                                    setState(() {
                                      isObsecure = !isObsecure;
                                    });
                                  },
                                ),
                                const Text("Show Password"),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            defaultButton(
                              background: HexColor("#011936"),
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  if (passwordController.text ==
                                      confirmPasswordController.text) {
                                    HomeCubit.get(context).userRegister(
                                      email: HomeCubit.get(context)
                                          .registerEmailController
                                          .text
                                          .trim()
                                          .toLowerCase(),
                                      name: HomeCubit.get(context)
                                          .firstNameController
                                          .text
                                          .trim()
                                          .toLowerCase(),
                                      password: passwordController.text,
                                    );
                                  } else {
                                    showToast(
                                        text: 'Check Confirm password',
                                        background: Colors.amber);
                                  }
                                  navigateTo(context, ImagePickerScreen());
                                } else {}
                              },
                              text: "Sign Up",
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              "By continuing you agree to accept our privacy, policy and terms of services",
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 5.0,
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
                            const Text(
                              "Sign Up With",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    "assets/images/facebookIcon.png",
                                    height: 60,
                                    width: 60,
                                  ),
                                  iconSize: 45,
                                ),
                                const SizedBox(
                                  width: 70,
                                ),
                                IconButton(
                                  onPressed: () {
                                    // HomeCubit.get(context).googleSignUp();
                                  },
                                  icon: Image.asset("assets/images/google.png"),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
