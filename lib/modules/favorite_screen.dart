import 'package:flutter/material.dart';
import 'package:pose_detection/shared/style/colors.dart';

class FavouriteScreen extends StatelessWidget {

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
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.black12)
                        ),
                        child: IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back,color: primary),),
                      ),
                      Spacer(),
                      Text(
                        "My Favourite",
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
                        child: IconButton(
                          onPressed: (){
                          },
                          icon: Image.asset("assets/images/heart.png",color: primary),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
