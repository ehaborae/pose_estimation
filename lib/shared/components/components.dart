import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pose_detection/modules/home_screen.dart';
import 'package:pose_detection/shared/cubit/home_cubit.dart';
import 'package:pose_detection/shared/cubit/home_states.dart';

import '../../modules/details_screen.dart';
import '../style/colors.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  required String? Function(String?) validate,
  bool isPassword = false,
  String? label,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  Function? onTap,
  double radius = 10.0,
  double height = 47,
  String? hint,
}) =>
    Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 10.0,
      child: SizedBox(
        height: 55,
        child: TextFormField(
          controller: controller,
          keyboardType: type,
          obscureText: isPassword,
          onFieldSubmitted: (s) {
            if (onSubmit != null) {
              onSubmit(s);
            }
          },
          onChanged: (s) {
            if (onChange != null) onChange(s);
          },
          validator: validate,
          onTap: () {
            if (onTap != null) {
              onTap();
            }
          },
          decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintText: hint,
              labelText: label,
              prefixIcon: Icon(prefix, color: HexColor("#011936")),
              suffix: suffix != null
                  ? IconButton(
                      onPressed: () {
                        if (suffixPressed != null) suffixPressed();
                      },
                      icon: Icon(
                        suffix,
                      ),
                    )
                  : null),
        ),
      ),
    );

Widget myDivider() => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.black12,
    );

Widget defaultFormField1({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  required String? Function(String?) validate,
  bool isPassword = false,
  String? label,
  IconData? suffix,
  Function? suffixPressed,
  Function? onTap,
  double radius = 10.0,
  double height = 47,
  String? hint,
}) =>
    Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black12)),
      child: SizedBox(
        height: 47,
        child: TextFormField(
          controller: controller,
          keyboardType: type,
          obscureText: isPassword,
          onFieldSubmitted: (s) {
            onSubmit!(s);
          },
          onChanged: (s) {
            onChange!(s);
          },
          validator: validate,
          onTap: () {
            onTap!();
          },
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintText: hint,
              labelText: label,
              suffix: suffix != null
                  ? IconButton(
                      onPressed: () {
                        suffixPressed!();
                      },
                      icon: Icon(
                        suffix,
                      ),
                    )
                  : null),
        ),
      ),
    );

void showToast({required String text, required Color background}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: background,
      textColor: Colors.white,
      fontSize: 16.0);

  //enum ToastStates{SUCCESS,ERROR,WARNING}
}

Widget defaultButton(
        {double width = double.infinity,
        required Color background,
        bool isUpperCase = true,
        double radius = 10.0,
        required void Function() function,
        required String text}) =>
    SizedBox(
      width: width,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 10,
        child: MaterialButton(
          color: HexColor("#011936"),
          height: 48.0,
          onPressed: function,
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );

void navigateAndFinish(
    {required BuildContext context, required Widget widget}) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

// Widget gridItem(
//     {required BuildContext context,
//     required ShirtModel model,
//     required bool isSelected}) {
//   return InkWell(
//     child: Container(
//       width: 200.0,
//       height: 300.0,
//       decoration: BoxDecoration(
//           color: Colors.grey.withOpacity(0.5),
//           border: Border.all(color: Colors.grey)),
//       padding: const EdgeInsets.all(1.0),
//       child: Column(
//         children: [
//           Stack(
//             children: [
//               Container(
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(20.0),
//                         bottomRight: Radius.circular(20.0)),
//                   ),
//                   height: 130.0,
//                   width: double.infinity,
//                   padding: const EdgeInsets.symmetric(vertical: 25.0),
//                   child:
//                       Image(image: AssetImage("assets/images/${model.image}"))),
//               BlocBuilder<HomeCubit, HomeStates>(
//                 builder: (context, state) {
//                   return IconButton(
//                     onPressed: () {
//                       HomeCubit.get(context).changeColor();
//                     },
//                     icon: Image.asset(
//                       "assets/images/heart.png",
//                       color: HomeCubit.get(context).color,
//                     ),
//                   );
//                 },
//               ),
//             ],
//             alignment: AlignmentDirectional.topEnd,
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 10.0),
//             child: Align(
//               alignment: Alignment.topLeft,
//               child: Text(
//                 model.name,
//                 style: TextStyle(color: primary),
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Spacer(),
//               Text(
//                 "${model.price}",
//                 style: TextStyle(color: Colors.red),
//               ),
//               const Spacer(),
//               Container(
//                   margin: const EdgeInsets.only(right: 5.0),
//                   width: 25,
//                   height: 25,
//                   decoration: BoxDecoration(
//                     color: primary,
//                     borderRadius: BorderRadiusDirectional.circular(20.0),
//                   ),
//                   child: Center(
//                     child: InkWell(
//                       onTap: () {},
//                       child: const Text(
//                         "+",
//                         style: TextStyle(fontSize: 16.0, color: Colors.white),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   )),
//             ],
//           ),
//         ],
//       ),
//     ),
//     onTap: () {
//       navigateTo(context, DetailsScreen());
//     },
//   );
// }

class GridItem extends StatefulWidget {
  const GridItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  final ShirtModel model;

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 200.0,
        height: 300.0,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            border: Border.all(color: Colors.grey)),
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0)),
                    ),
                    height: 130.0,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: Image(
                        image:
                            AssetImage("assets/images/${widget.model.image}"))),
                IconButton(
                  onPressed: () {
                    setState(() {});
                    isSelected = !isSelected;
                  },
                  icon: Image.asset(
                    "assets/images/heart.png",
                    color: isSelected ? primary : Colors.grey,
                  ),
                ),
              ],
              alignment: AlignmentDirectional.topEnd,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.model.name,
                  style: TextStyle(color: primary),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                  "${widget.model.price}",
                  style: const TextStyle(color: Colors.red),
                ),
                const Spacer(),
                Container(
                    margin: const EdgeInsets.only(right: 5.0),
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadiusDirectional.circular(20.0),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {},
                        child: const Text(
                          "+",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        navigateTo(context, DetailsScreen());
      },
    );
  }
}

class SideTextItem extends StatelessWidget {
  final String text;
  final int index;

  const SideTextItem({
    Key? key,
    required this.text,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return RotatedBox(
          quarterTurns: 3,
          child: TextButton(
            child: Text(
              text,
              style: TextStyle(
                  color: HomeCubit.get(context).selectedIndex == index
                      ? primary
                      : Colors.grey[500]),
            ),
            onPressed: () {
              HomeCubit.get(context).changeSelectedText(index: index);
            },
          ),
        );
      },
    );
  }
}

class PaymentItem extends StatelessWidget {
  final String text;
  final int index;
  final String image;

  const PaymentItem({
    Key? key,
    required this.text,
    required this.index,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return Row(
          children: [
            Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.black12)),
                child: Image(
                  image: AssetImage("assets/images/$image"),
                )),
            const SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "**** **** 0375 7420",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: primary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                HomeCubit.get(context).changeContainerColor(index: index);
              },
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.black12),
                  color: HomeCubit.get(context).selectedPaymentIndex == index
                      ? primary
                      : Colors.grey.withOpacity(0.5),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class SizeItem extends StatelessWidget {
  const SizeItem({
    Key? key,
    required this.index,
    required this.text,
  }) : super(key: key);
  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            HomeCubit.get(context).changeSelectedSizeText(index: index);
          },
          child: Container(
            margin: const EdgeInsets.only(left: 5.0),
            width: 50,
            height: 40,
            decoration: BoxDecoration(
              color: HomeCubit.get(context).selectedSizeIndex == index
                  ? primary
                  : Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadiusDirectional.circular(10.0),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16.0,
                  color: HomeCubit.get(context).selectedSizeIndex == index
                      ? Colors.white
                      : primary,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class DialogChangePhoto extends StatelessWidget {
  const DialogChangePhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return AlertDialog(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Center(
              child: Text("Choose option",
                  style: Theme.of(context).textTheme.headline6)),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: 60.0,
                  width: 40.0,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10.0),
                    onTap: () {
                      HomeCubit.get(context).selectCamera(context);
                    },
                    child: Material(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                      child: Icon(
                        FontAwesomeIcons.cameraRetro,
                        size: 25.0,
                        color: primary,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: SizedBox(
                  height: 60.0,
                  width: 40.0,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10.0),
                    onTap: () {
                      HomeCubit.get(context).selectImage(context);
                    },
                    child: Material(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200],
                      child: Icon(
                        FontAwesomeIcons.solidImages,
                        size: 25.0,
                        color: primary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
