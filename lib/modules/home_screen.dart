import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pose_detection/modules/myCartScreen.dart';
import 'package:pose_detection/shared/components/components.dart';
import 'package:pose_detection/shared/cubit/home_cubit.dart';
import 'package:pose_detection/shared/cubit/home_states.dart';
import 'package:pose_detection/shared/style/colors.dart';

import '../pages/home/home_page.dart';

class HomeScreen extends StatelessWidget {
  var searchController = TextEditingController();
  List<String> listSideTexts = [
    'Shirt',
    'T-Shirt',
    'Coat',
    'Trouser',
    'Sweat Shirt',
  ];

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          top: true,
          child: Scaffold(
            backgroundColor: primary,
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: MediaQuery.of(context).size.height -
                        kBottomNavigationBarHeight,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.only(
                          bottomStart: Radius.circular(50.0),
                          bottomEnd: Radius.circular(50.0)),
                      image: DecorationImage(
                        image: AssetImage('assets/images/background.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: IconButton(
                                onPressed: () {
                                  navigateTo(context, const HomePage());
                                },
                                icon: Image.asset(
                                    "assets/images/fourdots_80930.png"),
                                alignment: Alignment.topRight,
                                color: HexColor("#011936"),
                                iconSize: 30,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CartScreen()));
                                },
                                icon: Image.asset(
                                    "assets/images/Shopping Cart.png",
                                    color: primary),
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Explore the",
                              style: TextStyle(fontSize: 30.0),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Newest Collection",
                              style: TextStyle(fontSize: 30.0),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  color: Colors.grey.withOpacity(0.9),
                                  child: SizedBox(
                                    height: 47.0,
                                    child: TextFormField(
                                      cursorColor: primary,
                                      controller: searchController,
                                      decoration: InputDecoration(
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          disabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          errorBorder: const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          focusedErrorBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                          hintText: "Search Here",
                                          suffixIcon: Icon(
                                            Icons.search,
                                            color: primary,
                                          ),
                                          suffixIconColor: primary),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                          "assets/images/filter.png"))),
                            )
                          ],
                        ),

                        // defaultFormField(controller: searchController, type: TextInputType.text, validate: (value){
                        //   if(value!.isEmpty){
                        //     return"password must not be empty";
                        //   }
                        //   return null;
                        // }, prefix: Icons.search),
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                width: 60.0,
                                height: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0)),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 100,
                                      child: Center(
                                        child: ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) =>
                                              SideTextItem(
                                            index: index,
                                            text: listSideTexts[index],
                                          ),
                                          itemCount: listSideTexts.length,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: GridView.count(
                                  physics: const BouncingScrollPhysics(),
                                  primary: false,
                                  padding: const EdgeInsets.all(20),
                                  crossAxisSpacing: 30,
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.6,
                                  children: <Widget>[
                                    GridItem(
                                        model: ShirtModel(
                                            name: 'morgan t-shirt',
                                            image: 'morgan t-shirt.png',
                                            price: 20.0)),
                                    GridItem(
                                        model: ShirtModel(
                                            name: 'morgan Blue',
                                            image: 'morganBlue.jpg',
                                            price: 30.0)),
                                    GridItem(
                                        model: ShirtModel(
                                            name: 'morgan green',
                                            image: 'morganGreen.jpg',
                                            price: 40.0)),
                                    GridItem(
                                        model: ShirtModel(
                                            name: 'morgan red',
                                            image: 'morganRed.jpg',
                                            price: 30.0)),
                                    GridItem(
                                        model: ShirtModel(
                                            name: 'morgan t-shirt',
                                            image: 'morgan t-shirt.png',
                                            price: 20.0)),
                                    GridItem(
                                        model: ShirtModel(
                                            name: 'morgan Blue',
                                            image: 'morganBlue.jpg',
                                            price: 30.0)),
                                    GridItem(
                                        model: ShirtModel(
                                            name: 'morgan green',
                                            image: 'morganGreen.jpg',
                                            price: 40.0)),
                                    GridItem(
                                        model: ShirtModel(
                                            name: 'morgan red',
                                            image: 'morganRed.jpg',
                                            price: 30.0)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ShirtModel {
  ShirtModel({
    required this.name,
    required this.image,
    required this.price,
  });

  final String image;
  final String name;
  final double price;
}
