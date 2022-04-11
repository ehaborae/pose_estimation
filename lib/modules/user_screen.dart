import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pose_detection/modules/login/login_screen.dart';
import 'package:pose_detection/shared/components/components.dart';
import 'package:pose_detection/shared/network/local/cash_helper.dart';
import 'package:pose_detection/shared/style/colors.dart';

import 'image_picker_screen.dart';

class UserScreen extends StatelessWidget {
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: 35.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    defaultFormField(
                      controller: usernameController,
                      type: TextInputType.text,
                      validate: (value) {},
                      prefix: Icons.person,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.text,
                      validate: (value) {},
                      prefix: Icons.email,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField(
                      controller: phoneController,
                      type: TextInputType.text,
                      validate: (value) {},
                      prefix: Icons.phone,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultButton(
                        background: primary,
                        function: () {
                          navigateTo(context, ImagePickerScreen());
                        },
                        text: "Update"),
                    const SizedBox(
                      height: 20.0,
                    ),
                    defaultButton(
                        background: primary,
                        function: () {
                          CashHelper.removeData(key: 'token').then((value) {
                            String cashedEmail =
                                CashHelper.getData(key: 'email') == null
                                    ? null
                                    : CashHelper.getData(key: 'email');
                            String cashedPassword =
                                CashHelper.getData(key: 'password') == null
                                    ? null
                                    : CashHelper.getData(key: 'password');
                            navigateTo(
                                context,
                                LoginScreen(
                                  cashedPassword: cashedPassword,
                                  cashedEmail: cashedEmail,
                                ));
                          }).catchError((error) {
                            print(error.toString());
                          });
                        },
                        text: "Logout")
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
