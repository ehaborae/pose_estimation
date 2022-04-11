import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pose_detection/layouts/app_layout.dart';
import 'package:pose_detection/modules/favorite_screen.dart';
import 'package:pose_detection/modules/home_screen.dart';
import 'package:pose_detection/modules/myCartScreen.dart';
import 'package:pose_detection/shared/components/components.dart';
import 'package:pose_detection/shared/cubit/home_cubit.dart';
import 'package:pose_detection/shared/cubit/home_states.dart';
import 'package:pose_detection/shared/style/colors.dart';

class DetailsScreen extends StatelessWidget {
  List<String> tshirts = [
    "morgan t-shirt.png",
    "morganBlue.jpg",
    "morganRed.jpg",
    "morganGreen.jpg",
  ];
  List<String> sizes = [
    'S',
    'M',
    'L',
    'XL',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: BlocConsumer<HomeCubit, HomeStates>(
          builder: (context, state) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          color: Colors.brown,
                          child: const Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "Price:24.99",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          color: HexColor("#011936"),
                          child: Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: InkWell(
                              onTap: () {
                                //print("heloooooooo");
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text(
                                  "Buy Now",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.1,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 1.1,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadiusDirectional.only(
                                bottomStart: Radius.circular(50.0),
                                bottomEnd: Radius.circular(50.0)),
                            image: DecorationImage(
                              image: AssetImage('assets/images/background.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 2.3,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: const BorderRadiusDirectional.only(
                                    bottomStart: Radius.circular(50.0),
                                    bottomEnd: Radius.circular(50.0)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                  color: Colors.black12)),
                                          child: IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.arrow_back,
                                                  color: primary)),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "DETAILS",
                                          style: TextStyle(
                                            fontSize: 35.0,
                                            color: primary,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const Spacer(),
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border:
                                                Border.all(color: Colors.black12),
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              navigateTo(
                                                  context, FavouriteScreen());
                                            },
                                            icon: Image.asset(
                                                "assets/images/heart.png",
                                                color: primary),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Image(
                                        image: AssetImage(
                                            "assets/images/${tshirts[HomeCubit.get(context).selectedShirtColorIndex]}"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: Container(
                                height: 44.0,
                                margin:
                                    const EdgeInsets.only(top: 10.0, right: 10.0),
                                decoration: BoxDecoration(
                                  color: HexColor("#011936"),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadiusDirectional.circular(
                                                    10.0),
                                          ),
                                          child: Center(
                                            child: InkWell(
                                              onTap: () {
                                                HomeCubit.get(context).minus();
                                              },
                                              child: const Text(
                                                "-",
                                                style: TextStyle(fontSize: 16.0),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: Text(
                                          "${HomeCubit.get(context).counter}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  10.0),
                                        ),
                                        child: Center(
                                          child: InkWell(
                                            onTap: () {
                                              HomeCubit.get(context).plus();
                                            },
                                            child: const Text(
                                              "+",
                                              style: TextStyle(fontSize: 16.0),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "MORGAN T-Shirt",
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      color: primary,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Size:",
                                  style:
                                      TextStyle(fontSize: 20.0, color: primary),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 11,
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    SizeItem(index: index, text: sizes[index]),
                                itemCount: sizes.length,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 17.0),
                              height: MediaQuery.of(context).size.height / 6,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Colors:",
                                    style: TextStyle(fontSize: 25.0),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        width: 10.0,
                                      ),
                                      itemBuilder: (context, index) => InkWell(
                                        onTap: () {
                                          HomeCubit.get(context)
                                              .changeSelectedShirtColorText(
                                                  index: index);
                                        },
                                        child: Container(
                                          child: Image.asset(
                                            "assets/images/${tshirts[index]}",
                                            scale: 20.0,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: HomeCubit.get(context)
                                                            .selectedShirtColorIndex ==
                                                        index
                                                    ? primary
                                                    : Colors.grey),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                      ),
                                      itemCount: tshirts.length,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          listener: (context, state) {
            if (state is CounterPlusState) {
              print("plus state ${state.counter}");
            }
            if (state is CounterMinusState) {
              print("minus state ${state.counter}");
            }
          },
        ),
      ),
    );
  }
}
