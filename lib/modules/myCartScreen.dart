
import 'package:flutter/material.dart';
import 'package:pose_detection/layouts/app_layout.dart';
import 'package:pose_detection/modules/home_screen.dart';
import 'package:pose_detection/modules/paymentScreen.dart';
import 'package:pose_detection/shared/components/components.dart';
import 'package:pose_detection/shared/style/colors.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

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
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.black12)
                          ),
                          child: IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back,color: primary),),
                        ),
                        const Spacer(),
                        Text(
                          "My Cart",
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
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.black12)
                          ),
                          child: IconButton(
                            onPressed: (){
                            },
                            icon: Image.asset("assets/images/Shopping Cart.png",color: primary),),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 200,
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                                child: const Image(image: AssetImage("assets/images/morgan t-shirt.png"),
                            ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Morgan T-shirt",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: primary,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40.0,
                                  ),
                                  Text(
                                    "Size: L",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: primary,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40.0,
                                  ),
                                  Text(
                                    "Price: 29.99",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 200,
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: const Image(image: AssetImage("assets/images/Versace Boys Black Cotton Logo T-Shirt.jpg"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Versace T-shirt",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: primary,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40.0,
                                  ),
                                  Text(
                                    "Size: M",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: primary,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 40.0,
                                  ),
                                  Text(
                                    "Price: 29.99",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      color: primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Row(
                            children: [
                              Text(
                                "Sub Total",
                                style: TextStyle(
                                  color: primary,
                                  fontSize: 20.0,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "59.98",
                                style: TextStyle(
                                  color: primary,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Row(
                            children: [
                              Text(
                                "Shipping",
                                style: TextStyle(
                                  color: primary,
                                  fontSize: 20.0,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "10.00",
                                style: TextStyle(
                                  color: primary,
                                  fontSize: 20.0,
                                ),
                              ),

                            ],
                          ),
                        ),
                        myDivider(),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Row(
                            children: [
                              Text(
                                "Total",
                                style: TextStyle(
                                  color: primary,
                                  fontSize: 20.0,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "69.98",
                                style: TextStyle(
                                  color: primary,
                                  fontSize: 20.0,
                                ),
                              ),

                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultButton(background: primary, function: (){
                          navigateTo(context, PaymentScreen());
                        }, text: "Checkout")

                      ],
                    ),


                  ],

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
