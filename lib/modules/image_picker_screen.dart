import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pose_detection/shared/components/components.dart';
import 'package:pose_detection/shared/cubit/home_cubit.dart';
import 'package:pose_detection/shared/cubit/home_states.dart';
import 'package:pose_detection/shared/style/colors.dart';

class ImagePickerScreen extends StatelessWidget {
  ImagePickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // if (state is UserAvatarSuccess) {
        //   showToast(message: 'تم رفع الصورة بنجاح', toastStates: ToastStates.SUCCESS);
        // }
      },
      builder: (context, state) {
        return SafeArea(
          top: true,
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (HomeCubit.get(context).imageFile != null)
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.width / 4,
                        backgroundImage:
                            FileImage(HomeCubit.get(context).imageFile!),
                      ),
                    if (HomeCubit.get(context).imageFile == null)
                      CircleAvatar(
                        backgroundImage: const NetworkImage(
                            'https://alresalah.ps/uploads/images/54887b2cc2924f742f75c8c6c40d22ef.jpg'),
                        radius: MediaQuery.of(context).size.width / 4,
                      ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          if (HomeCubit.get(context).imageFile != null)
                            Expanded(
                              child: defaultButton(
                                // textColor: Colors.white,
                                text: 'Upload',
                                background: primary,
                                function: () {
                                  // HomeCubit.get(context).userAvatar();
                                },
                              ),
                            ),
                          if (HomeCubit.get(context).imageFile == null)
                            Expanded(
                              child: defaultButton(
                                // textColor: HexColor(surface),
                                text: 'Choose new image',
                                background: primary,
                                function: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          const DialogChangePhoto());
                                },
                              ),
                            ),
                          if (HomeCubit.get(context).imageFile != null)
                            const SizedBox(
                              width: 15.0,
                            ),
                          // if (HomeCubit.get(context).imageFile != null)
                          //   SizedBox(
                          //     height: 40.0,
                          //     width: 40.0,
                          //     child: state is UserAvatarLoading
                          //         ? const CupertinoActivityIndicator()
                          //         : Material(
                          //       clipBehavior:
                          //       Clip.antiAliasWithSaveLayer,
                          //       borderRadius:
                          //       BorderRadius.circular(10.0),
                          //       color: HexColor(greyWhite),
                          //       child: IconButton(
                          //         onPressed: () {
                          //           HomeCubit.get(context)
                          //               .clearSelectedImage();
                          //         },
                          //         icon: Icon(
                          //           Icons.delete_rounded,
                          //           size: 16.0,
                          //           color: HexColor(red),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
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
