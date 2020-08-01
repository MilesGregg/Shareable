import 'package:Shareable/commons/radial_progress.dart';
import 'package:Shareable/commons/rounded_image.dart';
import 'package:Shareable/styleguide/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadialProgress(
            width: 4,
            goalCompleted: 0.9,
            child: RoundedImage(
              imagePath: "assets/spencer.jpg",
              size: Size.fromWidth(120.0),
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Bob Joe",
                style: whiteNameTextStyle,
              ),
            ],
          ),
          /*SizedBox(height: 10,),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "50 Shares",
                  style: whiteSubHeadingTextStyle,
                )
              ],
          ),*/
        ],
      ),
    );
  }
}
