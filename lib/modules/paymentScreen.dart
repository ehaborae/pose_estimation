import 'package:flutter/material.dart';
import 'package:pose_detection/modules/myCartScreen.dart';
import 'package:pose_detection/shared/components/components.dart';
import 'package:pose_detection/shared/cubit/home_cubit.dart';
import 'package:pose_detection/shared/style/colors.dart';

class PaymentScreen extends StatelessWidget {
  var ownerController=TextEditingController();
  var numberController=TextEditingController();
  var dateController=TextEditingController();
  var codeController=TextEditingController();
  List<String> payments = [
    'Apple Pay',
    'Master Card',
    'PayPal',

  ];
  List<String> images = [
    'apple.png',
    'masterCard.png',
    'paypal.png',

  ];


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

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    // SizedBox(
                    //   height: 10.0,
                    // ),
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
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
                            },
                            icon: Icon(Icons.arrow_back,color: primary),),
                        ),
                        Spacer(),
                        Text(
                          "Checkout",
                          style: TextStyle(
                            fontSize: 35.0,
                            color: primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Spacer(),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.black12)
                          ),
                          child: Image(
                            image: AssetImage("assets/images/checkout.png"),
                          )
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Payment Method",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context,index)=>SizedBox(height: 15.0,),
                      itemBuilder: (context, index) =>
                          PaymentItem(
                            index: index,
                            text: payments[index],
                            image: images[index],
                          ),
                      itemCount: payments.length,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Card Owner",
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    defaultFormField1(controller: ownerController, type: TextInputType.text, validate: (value){}),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Card number",
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    defaultFormField1(controller: numberController, type: TextInputType.number, validate: (value){}),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Expiration Date",
                                style: TextStyle(
                                  fontSize: 17.0,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              defaultFormField1(controller: dateController, type: TextInputType.datetime, validate: (value){},hint: "MM/YY"),
                            ],

                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CVC Code",
                                style: TextStyle(
                                  fontSize: 17.0,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              defaultFormField1(controller: codeController, type: TextInputType.number, validate: (value){}),
                            ],

                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultButton(background: primary, function: (){}, text: "Checkout"),
                    SizedBox(
                      height: 20.0,
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