import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pose_detection/modules/favourite_style_screen.dart';
import 'package:pose_detection/shared/components/components.dart';
import 'package:pose_detection/shared/cubit/home_cubit.dart';
import 'package:pose_detection/shared/style/colors.dart';

class PreferredColor extends StatelessWidget {
  const PreferredColor({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
              IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back,color: primary),),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "What's Your Preferred Color?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: HomeCubit.get(context).textBoxSelected,
                          activeColor: HexColor("#011936"),
                          onChanged: (value) {
                            HomeCubit.get(context).changeTextBoxColor();
                          },
                        ),
                        const Text("black"),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: HomeCubit.get(context).textBoxSelected,
                          activeColor: HexColor("#011936"),
                          onChanged: (value) {
                            HomeCubit.get(context).changeTextBoxColor();
                          },
                        ),
                        const Text("white"),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: HomeCubit.get(context).textBoxSelected,
                          activeColor: HexColor("#011936"),
                          onChanged: (value) {
                            HomeCubit.get(context).changeTextBoxColor();
                          },
                        ),
                        const Text("blue"),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: HomeCubit.get(context).textBoxSelected,
                          activeColor: HexColor("#011936"),
                          onChanged: (value) {
                            HomeCubit.get(context).changeTextBoxColor();
                          },
                        ),
                        const Text("black"),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: HomeCubit.get(context).textBoxSelected,
                          activeColor: HexColor("#011936"),
                          onChanged: (value) {
                            HomeCubit.get(context).changeTextBoxColor();
                          },
                        ),
                        const Text("green"),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: HomeCubit.get(context).textBoxSelected,
                          activeColor: HexColor("#011936"),
                          onChanged: (value) {
                            HomeCubit.get(context).changeTextBoxColor();
                          },
                        ),
                        const Text("yellow"),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultButton(background:primary, function: (){
                      navigateTo(context, FavouriteStyle());
                    }, text: "next"),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}