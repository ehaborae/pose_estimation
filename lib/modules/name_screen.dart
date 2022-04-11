import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pose_detection/modules/prefered_color_screen.dart';
import 'package:pose_detection/shared/components/components.dart';
import 'package:pose_detection/shared/style/colors.dart';

class NameScreen extends StatelessWidget {
  var nameController=TextEditingController();
  var formKey = GlobalKey<FormState>();


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
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                       "What's Your Name?",
                       style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 25,
                       ),
                     ),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField1(
                        controller: nameController,
                        type: TextInputType.text,
                        validate: (value){
                          if (value!.isEmpty) {
                      return "name must not be empty";
                    }
                    return null;
                        }),
                    SizedBox(
                      height: 100.0,
                    ),
                    defaultButton(background:primary, function: (){
                        if (formKey.currentState!.validate()) {
                          navigateTo(context, PreferredColor());
                          print(nameController.text);
                        }
                    }, text: "next"),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
